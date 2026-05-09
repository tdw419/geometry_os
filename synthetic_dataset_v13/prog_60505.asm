; DESCRIPTION: Draws a purple line from (68, 19) to (414, 205).
; PLAN: r0=68(x1), r1=19(y1), r2=414(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 19
LDI r2, 414
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
