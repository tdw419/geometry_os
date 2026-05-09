; DESCRIPTION: Renders a magenta line between points (278, 101) and (336, 44).
; PLAN: r0=278(x1), r1=101(y1), r2=336(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 101
LDI r2, 336
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
