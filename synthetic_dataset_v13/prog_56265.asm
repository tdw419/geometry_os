; DESCRIPTION: Renders a yellow line between points (509, 145) and (158, 251).
; PLAN: r0=509(x1), r1=145(y1), r2=158(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 145
LDI r2, 158
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
