; DESCRIPTION: Composite: Places a orange line segment connecting (181, 245) to (135, 247) then Sets a single red pixel at (433, 53).
; PLAN: r0=181(x1), r1=245(y1), r2=135(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=53(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 181
LDI r1, 245
LDI r2, 135
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 53
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
