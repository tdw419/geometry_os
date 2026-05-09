; DESCRIPTION: Renders a magenta line between points (395, 155) and (118, 24).
; PLAN: r0=395(x1), r1=155(y1), r2=118(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 155
LDI r2, 118
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
