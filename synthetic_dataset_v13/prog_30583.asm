; DESCRIPTION: Draws a purple line from (304, 181) to (133, 174).
; PLAN: r0=304(x1), r1=181(y1), r2=133(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 181
LDI r2, 133
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
