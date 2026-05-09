; DESCRIPTION: Renders a yellow line between points (379, 90) and (62, 66).
; PLAN: r0=379(x1), r1=90(y1), r2=62(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 90
LDI r2, 62
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
