; DESCRIPTION: Renders a yellow line between points (93, 208) and (319, 40).
; PLAN: r0=93(x1), r1=208(y1), r2=319(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 208
LDI r2, 319
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
