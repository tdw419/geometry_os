; DESCRIPTION: Renders a black line between points (378, 163) and (360, 35).
; PLAN: r0=378(x1), r1=163(y1), r2=360(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 163
LDI r2, 360
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
