; DESCRIPTION: Places a blue line segment connecting (216, 132) to (18, 51).
; PLAN: r0=216(x1), r1=132(y1), r2=18(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 132
LDI r2, 18
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
