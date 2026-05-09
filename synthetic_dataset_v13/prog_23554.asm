; DESCRIPTION: Renders a magenta line between points (77, 76) and (287, 129).
; PLAN: r0=77(x1), r1=76(y1), r2=287(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 76
LDI r2, 287
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
