; DESCRIPTION: Renders a green line between points (86, 118) and (411, 129).
; PLAN: r0=86(x1), r1=118(y1), r2=411(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 118
LDI r2, 411
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
