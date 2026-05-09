; DESCRIPTION: Draws a purple line from (135, 247) to (506, 207).
; PLAN: r0=135(x1), r1=247(y1), r2=506(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 247
LDI r2, 506
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
