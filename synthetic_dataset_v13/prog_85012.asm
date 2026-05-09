; DESCRIPTION: Renders a yellow line between points (188, 128) and (507, 201).
; PLAN: r0=188(x1), r1=128(y1), r2=507(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 128
LDI r2, 507
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
