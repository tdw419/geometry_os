; DESCRIPTION: Draws a yellow line from (44, 192) to (161, 232).
; PLAN: r0=44(x1), r1=192(y1), r2=161(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 192
LDI r2, 161
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
