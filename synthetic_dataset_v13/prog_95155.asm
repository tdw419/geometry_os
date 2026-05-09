; DESCRIPTION: Draws a purple line from (51, 114) to (417, 55).
; PLAN: r0=51(x1), r1=114(y1), r2=417(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 114
LDI r2, 417
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
