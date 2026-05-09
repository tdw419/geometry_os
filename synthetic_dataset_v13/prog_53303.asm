; DESCRIPTION: Composite: Renders a orange box of size 35x53 starting at (203, 38) then Renders a black disk with center (227, 175) and radius 24 then Sets a single white pixel at (301, 132).
; PLAN: r0=203(x), r1=38(y), r2=35(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=175(y), r7=24(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=301(x), r11=132(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 203
LDI r1, 38
LDI r2, 35
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 175
LDI r7, 24
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 301
LDI r11, 132
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
