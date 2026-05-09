; DESCRIPTION: Composite: Places a orange line segment connecting (462, 44) to (496, 83) then Sets a single purple pixel at (488, 30).
; PLAN: r0=462(x1), r1=44(y1), r2=496(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=488(x), r6=30(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 462
LDI r1, 44
LDI r2, 496
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 30
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
