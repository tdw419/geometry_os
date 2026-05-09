; DESCRIPTION: Renders a yellow line between points (84, 246) and (451, 196).
; PLAN: r0=84(x1), r1=246(y1), r2=451(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 246
LDI r2, 451
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
