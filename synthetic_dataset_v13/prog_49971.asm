; DESCRIPTION: Renders a magenta line between points (336, 185) and (100, 31).
; PLAN: r0=336(x1), r1=185(y1), r2=100(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 185
LDI r2, 100
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
