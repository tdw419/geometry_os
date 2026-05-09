; DESCRIPTION: Draws a purple line from (51, 1) to (16, 250).
; PLAN: r0=51(x1), r1=1(y1), r2=16(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 1
LDI r2, 16
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
