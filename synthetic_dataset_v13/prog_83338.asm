; DESCRIPTION: Draws a purple line from (142, 207) to (280, 248).
; PLAN: r0=142(x1), r1=207(y1), r2=280(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 207
LDI r2, 280
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
