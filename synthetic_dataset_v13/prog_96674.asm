; DESCRIPTION: Composite: Creates a black rectangular region at (101, 7) spanning 48 by 108 pixels then Places a black circle of radius 76 at center (88, 132) then Sets a single green pixel at (48, 187).
; PLAN: r0=101(x), r1=7(y), r2=48(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=132(y), r7=76(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=48(x), r11=187(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 101
LDI r1, 7
LDI r2, 48
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 132
LDI r7, 76
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 48
LDI r11, 187
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
