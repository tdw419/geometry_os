; DESCRIPTION: Renders a magenta line between points (109, 225) and (448, 184).
; PLAN: r0=109(x1), r1=225(y1), r2=448(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 225
LDI r2, 448
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
