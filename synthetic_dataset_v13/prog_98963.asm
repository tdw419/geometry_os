; DESCRIPTION: Renders a magenta line between points (147, 194) and (138, 238).
; PLAN: r0=147(x1), r1=194(y1), r2=138(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 194
LDI r2, 138
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
