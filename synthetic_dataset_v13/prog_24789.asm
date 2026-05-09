; DESCRIPTION: Renders a magenta line between points (223, 200) and (184, 20).
; PLAN: r0=223(x1), r1=200(y1), r2=184(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 200
LDI r2, 184
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
