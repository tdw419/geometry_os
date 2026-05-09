; DESCRIPTION: Renders a green line between points (193, 110) and (5, 130).
; PLAN: r0=193(x1), r1=110(y1), r2=5(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 110
LDI r2, 5
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
