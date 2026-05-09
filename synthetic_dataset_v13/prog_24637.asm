; DESCRIPTION: Renders a black line between points (90, 139) and (119, 137).
; PLAN: r0=90(x1), r1=139(y1), r2=119(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 139
LDI r2, 119
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
