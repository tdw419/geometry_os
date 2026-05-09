; DESCRIPTION: Draws a purple line from (18, 145) to (77, 69).
; PLAN: r0=18(x1), r1=145(y1), r2=77(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 145
LDI r2, 77
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
