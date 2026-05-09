; DESCRIPTION: Renders a yellow line between points (492, 216) and (506, 68).
; PLAN: r0=492(x1), r1=216(y1), r2=506(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 216
LDI r2, 506
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
