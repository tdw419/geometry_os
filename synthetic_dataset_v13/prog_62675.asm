; DESCRIPTION: Draws a purple line from (302, 154) to (56, 230).
; PLAN: r0=302(x1), r1=154(y1), r2=56(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 154
LDI r2, 56
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
