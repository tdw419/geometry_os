; DESCRIPTION: Renders a black line between points (3, 244) and (342, 15).
; PLAN: r0=3(x1), r1=244(y1), r2=342(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 244
LDI r2, 342
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
