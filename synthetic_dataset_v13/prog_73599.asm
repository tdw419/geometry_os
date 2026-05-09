; DESCRIPTION: Renders a yellow line between points (388, 168) and (54, 118).
; PLAN: r0=388(x1), r1=168(y1), r2=54(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 168
LDI r2, 54
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
