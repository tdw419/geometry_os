; DESCRIPTION: Renders a green line between points (507, 144) and (162, 155).
; PLAN: r0=507(x1), r1=144(y1), r2=162(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 144
LDI r2, 162
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
