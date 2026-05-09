; DESCRIPTION: Places a purple line segment connecting (504, 212) to (164, 63).
; PLAN: r0=504(x1), r1=212(y1), r2=164(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 212
LDI r2, 164
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
