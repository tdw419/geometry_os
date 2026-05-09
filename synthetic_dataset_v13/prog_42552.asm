; DESCRIPTION: Renders a magenta line between points (0, 11) and (192, 130).
; PLAN: r0=0(x1), r1=11(y1), r2=192(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 11
LDI r2, 192
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
