; DESCRIPTION: Places a magenta line segment connecting (441, 48) to (496, 157).
; PLAN: r0=441(x1), r1=48(y1), r2=496(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 48
LDI r2, 496
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
