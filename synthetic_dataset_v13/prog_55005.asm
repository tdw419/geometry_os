; DESCRIPTION: Draws a purple line from (382, 12) to (451, 216).
; PLAN: r0=382(x1), r1=12(y1), r2=451(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 12
LDI r2, 451
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
