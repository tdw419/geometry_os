; DESCRIPTION: Renders a magenta line between points (129, 20) and (122, 93).
; PLAN: r0=129(x1), r1=20(y1), r2=122(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 20
LDI r2, 122
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
