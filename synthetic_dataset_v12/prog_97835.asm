; DESCRIPTION: Renders a yellow line between points (69, 198) and (232, 23).
; PLAN: r0=69(x1), r1=198(y1), r2=232(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 198
LDI r2, 232
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
