; DESCRIPTION: Draws a purple line from (10, 226) to (275, 232).
; PLAN: r0=10(x1), r1=226(y1), r2=275(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 226
LDI r2, 275
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
