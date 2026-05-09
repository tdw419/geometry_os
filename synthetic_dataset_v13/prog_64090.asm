; DESCRIPTION: Composite: Renders a orange box of size 60x62 starting at (40, 115) then Places a black circle of radius 43 at center (381, 97).
; PLAN: r0=40(x), r1=115(y), r2=60(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=97(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 40
LDI r1, 115
LDI r2, 60
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 97
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
