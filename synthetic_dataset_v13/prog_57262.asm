; DESCRIPTION: Renders a black line between points (122, 199) and (385, 102).
; PLAN: r0=122(x1), r1=199(y1), r2=385(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 199
LDI r2, 385
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
