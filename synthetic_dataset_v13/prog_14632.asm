; DESCRIPTION: Renders a green line between points (223, 46) and (478, 145).
; PLAN: r0=223(x1), r1=46(y1), r2=478(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 46
LDI r2, 478
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
