; DESCRIPTION: Draws a purple line from (400, 199) to (51, 243).
; PLAN: r0=400(x1), r1=199(y1), r2=51(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 199
LDI r2, 51
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
