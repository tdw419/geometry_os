; DESCRIPTION: Draws a purple line from (396, 133) to (376, 21).
; PLAN: r0=396(x1), r1=133(y1), r2=376(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 133
LDI r2, 376
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
