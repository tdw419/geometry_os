; DESCRIPTION: Places a blue line segment connecting (492, 51) to (169, 9).
; PLAN: r0=492(x1), r1=51(y1), r2=169(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 51
LDI r2, 169
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
