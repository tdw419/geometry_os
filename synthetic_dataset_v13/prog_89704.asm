; DESCRIPTION: Places a magenta line segment connecting (84, 252) to (425, 237).
; PLAN: r0=84(x1), r1=252(y1), r2=425(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 252
LDI r2, 425
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
