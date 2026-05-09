; DESCRIPTION: Renders a yellow line between points (188, 192) and (219, 91).
; PLAN: r0=188(x1), r1=192(y1), r2=219(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 192
LDI r2, 219
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
