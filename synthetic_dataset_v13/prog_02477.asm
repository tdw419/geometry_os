; DESCRIPTION: Draws a purple line from (276, 59) to (444, 144).
; PLAN: r0=276(x1), r1=59(y1), r2=444(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 59
LDI r2, 444
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
