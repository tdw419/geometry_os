; DESCRIPTION: Renders a yellow line between points (363, 66) and (311, 250).
; PLAN: r0=363(x1), r1=66(y1), r2=311(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 66
LDI r2, 311
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
