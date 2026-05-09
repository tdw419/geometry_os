; DESCRIPTION: Renders a black line between points (287, 95) and (232, 82).
; PLAN: r0=287(x1), r1=95(y1), r2=232(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 95
LDI r2, 232
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
