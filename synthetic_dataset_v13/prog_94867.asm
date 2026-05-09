; DESCRIPTION: Renders a black line between points (141, 234) and (25, 122).
; PLAN: r0=141(x1), r1=234(y1), r2=25(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 234
LDI r2, 25
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
