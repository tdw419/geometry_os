; DESCRIPTION: Renders a black line between points (431, 153) and (396, 11).
; PLAN: r0=431(x1), r1=153(y1), r2=396(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 153
LDI r2, 396
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
