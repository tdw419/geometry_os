; DESCRIPTION: Renders a black line between points (13, 150) and (159, 194).
; PLAN: r0=13(x1), r1=150(y1), r2=159(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 150
LDI r2, 159
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
