; DESCRIPTION: Places a magenta line segment connecting (98, 227) to (358, 11).
; PLAN: r0=98(x1), r1=227(y1), r2=358(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 227
LDI r2, 358
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
