; DESCRIPTION: Draws a purple line from (162, 184) to (245, 230).
; PLAN: r0=162(x1), r1=184(y1), r2=245(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 184
LDI r2, 245
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
