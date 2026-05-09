; DESCRIPTION: Renders a green line between points (24, 34) and (56, 211).
; PLAN: r0=24(x1), r1=34(y1), r2=56(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 34
LDI r2, 56
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
