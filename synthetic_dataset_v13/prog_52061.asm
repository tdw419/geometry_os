; DESCRIPTION: Places a green line segment connecting (395, 147) to (199, 67).
; PLAN: r0=395(x1), r1=147(y1), r2=199(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 147
LDI r2, 199
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
