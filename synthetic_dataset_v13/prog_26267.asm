; DESCRIPTION: Renders a yellow line between points (172, 100) and (473, 130).
; PLAN: r0=172(x1), r1=100(y1), r2=473(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 100
LDI r2, 473
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
