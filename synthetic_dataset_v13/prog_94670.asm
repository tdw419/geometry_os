; DESCRIPTION: Renders a magenta line between points (219, 62) and (93, 85).
; PLAN: r0=219(x1), r1=62(y1), r2=93(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 62
LDI r2, 93
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
