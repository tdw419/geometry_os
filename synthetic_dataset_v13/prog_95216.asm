; DESCRIPTION: Renders a magenta line between points (449, 151) and (109, 147).
; PLAN: r0=449(x1), r1=151(y1), r2=109(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 151
LDI r2, 109
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
