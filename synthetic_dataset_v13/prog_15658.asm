; DESCRIPTION: Draws a purple line from (29, 188) to (223, 158).
; PLAN: r0=29(x1), r1=188(y1), r2=223(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 188
LDI r2, 223
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
