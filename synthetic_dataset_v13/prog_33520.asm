; DESCRIPTION: Composite: Places a orange line segment connecting (134, 164) to (438, 39) then Places a blue circle of radius 15 at center (467, 174) then Sets a single blue pixel at (174, 100).
; PLAN: r0=134(x1), r1=164(y1), r2=438(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=174(y), r7=15(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=174(x), r11=100(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 134
LDI r1, 164
LDI r2, 438
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 174
LDI r7, 15
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 174
LDI r11, 100
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
