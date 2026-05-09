; DESCRIPTION: Places a black line segment connecting (63, 145) to (135, 136).
; PLAN: r0=63(x1), r1=145(y1), r2=135(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 145
LDI r2, 135
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
