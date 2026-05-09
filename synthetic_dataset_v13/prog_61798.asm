; DESCRIPTION: Renders a magenta line between points (116, 100) and (336, 219).
; PLAN: r0=116(x1), r1=100(y1), r2=336(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 100
LDI r2, 336
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
