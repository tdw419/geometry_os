; DESCRIPTION: Draws a purple line from (182, 216) to (241, 84).
; PLAN: r0=182(x1), r1=216(y1), r2=241(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 216
LDI r2, 241
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
