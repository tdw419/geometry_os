; DESCRIPTION: Places a magenta line segment connecting (199, 251) to (237, 89).
; PLAN: r0=199(x1), r1=251(y1), r2=237(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 251
LDI r2, 237
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
