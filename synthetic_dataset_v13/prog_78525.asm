; DESCRIPTION: Renders a black line between points (474, 24) and (378, 35).
; PLAN: r0=474(x1), r1=24(y1), r2=378(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 24
LDI r2, 378
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
