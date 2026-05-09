; DESCRIPTION: Renders a yellow line between points (136, 9) and (396, 45).
; PLAN: r0=136(x1), r1=9(y1), r2=396(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 9
LDI r2, 396
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
