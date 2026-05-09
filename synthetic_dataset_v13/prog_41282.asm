; DESCRIPTION: Renders a green line between points (166, 183) and (192, 147).
; PLAN: r0=166(x1), r1=183(y1), r2=192(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 183
LDI r2, 192
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
