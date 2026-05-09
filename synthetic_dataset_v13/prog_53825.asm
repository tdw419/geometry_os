; DESCRIPTION: Places a magenta line segment connecting (332, 252) to (349, 4).
; PLAN: r0=332(x1), r1=252(y1), r2=349(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 252
LDI r2, 349
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
