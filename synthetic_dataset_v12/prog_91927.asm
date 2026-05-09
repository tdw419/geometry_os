; DESCRIPTION: Draws a purple line from (253, 9) to (166, 217).
; PLAN: r0=253(x1), r1=9(y1), r2=166(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 9
LDI r2, 166
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
