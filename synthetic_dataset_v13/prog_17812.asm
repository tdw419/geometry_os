; DESCRIPTION: Composite: Places a purple line segment connecting (83, 225) to (63, 171) then Sets a single orange pixel at (460, 191).
; PLAN: r0=83(x1), r1=225(y1), r2=63(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=460(x), r6=191(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 225
LDI r2, 63
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 191
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
