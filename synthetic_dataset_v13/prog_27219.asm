; DESCRIPTION: Renders a magenta line between points (109, 229) and (163, 3).
; PLAN: r0=109(x1), r1=229(y1), r2=163(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 229
LDI r2, 163
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
