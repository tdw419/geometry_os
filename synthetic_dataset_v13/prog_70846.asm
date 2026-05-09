; DESCRIPTION: Renders a magenta line between points (219, 82) and (312, 205).
; PLAN: r0=219(x1), r1=82(y1), r2=312(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 82
LDI r2, 312
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
