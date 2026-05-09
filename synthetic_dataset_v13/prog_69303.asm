; DESCRIPTION: Places a purple line segment connecting (99, 185) to (51, 43).
; PLAN: r0=99(x1), r1=185(y1), r2=51(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 185
LDI r2, 51
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
