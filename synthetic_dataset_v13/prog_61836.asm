; DESCRIPTION: Draws a purple line from (214, 97) to (123, 133).
; PLAN: r0=214(x1), r1=97(y1), r2=123(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 97
LDI r2, 123
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
