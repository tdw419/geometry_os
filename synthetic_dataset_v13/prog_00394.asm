; DESCRIPTION: Draws a purple line from (15, 108) to (129, 222).
; PLAN: r0=15(x1), r1=108(y1), r2=129(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 108
LDI r2, 129
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
