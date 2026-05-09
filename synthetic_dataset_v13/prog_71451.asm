; DESCRIPTION: Renders a green line between points (200, 137) and (490, 91).
; PLAN: r0=200(x1), r1=137(y1), r2=490(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 137
LDI r2, 490
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
