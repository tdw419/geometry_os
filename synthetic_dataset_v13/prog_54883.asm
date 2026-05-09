; DESCRIPTION: Renders a black line between points (40, 82) and (360, 130).
; PLAN: r0=40(x1), r1=82(y1), r2=360(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 82
LDI r2, 360
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
