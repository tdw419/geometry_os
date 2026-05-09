; DESCRIPTION: Renders a black line between points (438, 57) and (258, 112).
; PLAN: r0=438(x1), r1=57(y1), r2=258(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 57
LDI r2, 258
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
