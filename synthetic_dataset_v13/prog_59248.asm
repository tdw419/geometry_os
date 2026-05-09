; DESCRIPTION: Renders a purple line between points (58, 2) and (290, 93).
; PLAN: r0=58(x1), r1=2(y1), r2=290(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 2
LDI r2, 290
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
