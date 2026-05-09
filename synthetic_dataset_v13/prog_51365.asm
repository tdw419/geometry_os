; DESCRIPTION: Composite: Places a magenta line segment connecting (412, 203) to (130, 238) then Sets a single orange pixel at (421, 251).
; PLAN: r0=412(x1), r1=203(y1), r2=130(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=251(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 412
LDI r1, 203
LDI r2, 130
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 251
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
