; DESCRIPTION: Renders a black line between points (332, 99) and (194, 139).
; PLAN: r0=332(x1), r1=99(y1), r2=194(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 99
LDI r2, 194
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
