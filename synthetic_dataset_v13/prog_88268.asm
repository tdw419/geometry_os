; DESCRIPTION: Renders a green line between points (193, 12) and (227, 147).
; PLAN: r0=193(x1), r1=12(y1), r2=227(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 12
LDI r2, 227
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
