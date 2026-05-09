; DESCRIPTION: Draws a purple line from (444, 249) to (29, 248).
; PLAN: r0=444(x1), r1=249(y1), r2=29(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 249
LDI r2, 29
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
