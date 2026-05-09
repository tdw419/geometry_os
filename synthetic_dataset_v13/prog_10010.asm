; DESCRIPTION: Draws a purple line from (442, 65) to (335, 11).
; PLAN: r0=442(x1), r1=65(y1), r2=335(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 65
LDI r2, 335
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
