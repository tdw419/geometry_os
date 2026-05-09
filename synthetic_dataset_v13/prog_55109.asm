; DESCRIPTION: Draws a purple line from (414, 103) to (437, 106).
; PLAN: r0=414(x1), r1=103(y1), r2=437(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 103
LDI r2, 437
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
