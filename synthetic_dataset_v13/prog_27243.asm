; DESCRIPTION: Renders a yellow line between points (337, 155) and (253, 166).
; PLAN: r0=337(x1), r1=155(y1), r2=253(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 155
LDI r2, 253
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
