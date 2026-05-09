; DESCRIPTION: Renders a yellow line between points (505, 159) and (255, 147).
; PLAN: r0=505(x1), r1=159(y1), r2=255(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 159
LDI r2, 255
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
