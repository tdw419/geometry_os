; DESCRIPTION: Draws a purple line from (217, 81) to (264, 140).
; PLAN: r0=217(x1), r1=81(y1), r2=264(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 81
LDI r2, 264
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
