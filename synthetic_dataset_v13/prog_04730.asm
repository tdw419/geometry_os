; DESCRIPTION: Renders a yellow line between points (192, 201) and (138, 167).
; PLAN: r0=192(x1), r1=201(y1), r2=138(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 201
LDI r2, 138
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
