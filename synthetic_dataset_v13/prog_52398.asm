; DESCRIPTION: Renders a yellow line between points (388, 60) and (37, 226).
; PLAN: r0=388(x1), r1=60(y1), r2=37(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 60
LDI r2, 37
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
