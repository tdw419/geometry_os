; DESCRIPTION: Draws a purple line from (213, 116) to (51, 93).
; PLAN: r0=213(x1), r1=116(y1), r2=51(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 116
LDI r2, 51
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
