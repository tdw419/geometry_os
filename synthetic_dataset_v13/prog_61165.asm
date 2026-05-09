; DESCRIPTION: Draws a purple line from (451, 241) to (442, 57).
; PLAN: r0=451(x1), r1=241(y1), r2=442(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 241
LDI r2, 442
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
