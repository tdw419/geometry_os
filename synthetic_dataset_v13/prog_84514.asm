; DESCRIPTION: Draws a purple line from (211, 65) to (213, 162).
; PLAN: r0=211(x1), r1=65(y1), r2=213(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 65
LDI r2, 213
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
