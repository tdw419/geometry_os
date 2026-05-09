; DESCRIPTION: Draws a purple line from (103, 248) to (72, 204).
; PLAN: r0=103(x1), r1=248(y1), r2=72(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 248
LDI r2, 72
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
