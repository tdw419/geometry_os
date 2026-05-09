; DESCRIPTION: Renders a green line between points (311, 54) and (114, 139).
; PLAN: r0=311(x1), r1=54(y1), r2=114(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 54
LDI r2, 114
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
