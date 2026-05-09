; DESCRIPTION: Renders a black line between points (125, 60) and (431, 11).
; PLAN: r0=125(x1), r1=60(y1), r2=431(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 60
LDI r2, 431
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
