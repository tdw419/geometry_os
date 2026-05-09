; DESCRIPTION: Composite: Renders a white box of size 119x75 starting at (163, 123) then Sets a single purple pixel at (123, 52) then Creates a black circular shape at (174, 210) with radius 35.
; PLAN: r0=163(x), r1=123(y), r2=119(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=52(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=174(x), r11=210(y), r12=35(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 163
LDI r1, 123
LDI r2, 119
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 52
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 174
LDI r11, 210
LDI r12, 35
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
