; DESCRIPTION: Draws a purple line from (218, 230) to (324, 227).
; PLAN: r0=218(x1), r1=230(y1), r2=324(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 230
LDI r2, 324
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
