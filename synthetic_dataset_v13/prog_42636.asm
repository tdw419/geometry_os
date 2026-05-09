; DESCRIPTION: Renders a black line between points (96, 153) and (192, 130).
; PLAN: r0=96(x1), r1=153(y1), r2=192(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 153
LDI r2, 192
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
