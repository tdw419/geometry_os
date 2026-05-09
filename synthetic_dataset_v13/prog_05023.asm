; DESCRIPTION: Draws a purple line from (444, 183) to (439, 230).
; PLAN: r0=444(x1), r1=183(y1), r2=439(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 183
LDI r2, 439
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
