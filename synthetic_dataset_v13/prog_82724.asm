; DESCRIPTION: Draws a purple line from (145, 111) to (233, 68).
; PLAN: r0=145(x1), r1=111(y1), r2=233(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 111
LDI r2, 233
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
