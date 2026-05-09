; DESCRIPTION: Renders a yellow line between points (139, 151) and (390, 187).
; PLAN: r0=139(x1), r1=151(y1), r2=390(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 151
LDI r2, 390
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
