; DESCRIPTION: Renders a black line between points (436, 251) and (199, 65).
; PLAN: r0=436(x1), r1=251(y1), r2=199(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 251
LDI r2, 199
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
