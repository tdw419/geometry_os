; DESCRIPTION: Draws a purple line from (489, 126) to (418, 248).
; PLAN: r0=489(x1), r1=126(y1), r2=418(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 126
LDI r2, 418
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
