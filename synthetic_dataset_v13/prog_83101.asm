; DESCRIPTION: Draws a purple line from (500, 68) to (280, 245).
; PLAN: r0=500(x1), r1=68(y1), r2=280(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 68
LDI r2, 280
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
