; DESCRIPTION: Places a blue line segment connecting (56, 72) to (334, 21).
; PLAN: r0=56(x1), r1=72(y1), r2=334(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 72
LDI r2, 334
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
