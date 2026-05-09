; DESCRIPTION: Renders a magenta line between points (6, 198) and (275, 116).
; PLAN: r0=6(x1), r1=198(y1), r2=275(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 198
LDI r2, 275
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
