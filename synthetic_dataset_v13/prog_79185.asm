; DESCRIPTION: Places a blue line segment connecting (3, 132) to (491, 36).
; PLAN: r0=3(x1), r1=132(y1), r2=491(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 132
LDI r2, 491
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
