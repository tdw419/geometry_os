; DESCRIPTION: Renders a yellow line between points (463, 26) and (336, 10).
; PLAN: r0=463(x1), r1=26(y1), r2=336(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 26
LDI r2, 336
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
