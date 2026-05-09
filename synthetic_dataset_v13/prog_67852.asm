; DESCRIPTION: Places a magenta line segment connecting (78, 237) to (252, 72).
; PLAN: r0=78(x1), r1=237(y1), r2=252(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 237
LDI r2, 252
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
