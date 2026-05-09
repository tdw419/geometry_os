; DESCRIPTION: Renders a yellow line between points (193, 158) and (83, 31).
; PLAN: r0=193(x1), r1=158(y1), r2=83(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 158
LDI r2, 83
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
