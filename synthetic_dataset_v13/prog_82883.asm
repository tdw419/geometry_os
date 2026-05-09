; DESCRIPTION: Renders a black line between points (139, 198) and (508, 149).
; PLAN: r0=139(x1), r1=198(y1), r2=508(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 198
LDI r2, 508
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
