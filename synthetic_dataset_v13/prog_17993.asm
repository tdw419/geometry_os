; DESCRIPTION: Renders a magenta line between points (205, 38) and (382, 130).
; PLAN: r0=205(x1), r1=38(y1), r2=382(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 38
LDI r2, 382
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
