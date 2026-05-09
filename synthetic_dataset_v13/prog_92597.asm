; DESCRIPTION: Draws a orange line from (140, 216) to (253, 232).
; PLAN: r0=140(x1), r1=216(y1), r2=253(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 216
LDI r2, 253
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
