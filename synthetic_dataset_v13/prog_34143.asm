; DESCRIPTION: Places a magenta line segment connecting (378, 214) to (119, 30).
; PLAN: r0=378(x1), r1=214(y1), r2=119(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 214
LDI r2, 119
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
