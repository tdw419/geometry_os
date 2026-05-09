; DESCRIPTION: Renders a yellow line between points (353, 74) and (311, 65).
; PLAN: r0=353(x1), r1=74(y1), r2=311(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 74
LDI r2, 311
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
