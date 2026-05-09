; DESCRIPTION: Composite: Places a purple line segment connecting (170, 148) to (371, 78) then Places a orange dot at position (475, 49).
; PLAN: r0=170(x1), r1=148(y1), r2=371(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=475(x), r6=49(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 170
LDI r1, 148
LDI r2, 371
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 49
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
