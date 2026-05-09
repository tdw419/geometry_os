; DESCRIPTION: Renders a yellow line between points (311, 100) and (123, 200).
; PLAN: r0=311(x1), r1=100(y1), r2=123(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 100
LDI r2, 123
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
