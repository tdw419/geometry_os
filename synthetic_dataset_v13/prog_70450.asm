; DESCRIPTION: Draws a purple line from (376, 86) to (451, 113).
; PLAN: r0=376(x1), r1=86(y1), r2=451(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 86
LDI r2, 451
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
