; DESCRIPTION: Draws a purple line from (176, 184) to (416, 221).
; PLAN: r0=176(x1), r1=184(y1), r2=416(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 184
LDI r2, 416
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
