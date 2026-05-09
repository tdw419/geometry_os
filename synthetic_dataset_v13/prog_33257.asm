; DESCRIPTION: Renders a magenta line between points (12, 119) and (141, 31).
; PLAN: r0=12(x1), r1=119(y1), r2=141(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 119
LDI r2, 141
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
