; DESCRIPTION: Renders a magenta line between points (336, 153) and (143, 129).
; PLAN: r0=336(x1), r1=153(y1), r2=143(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 153
LDI r2, 143
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
