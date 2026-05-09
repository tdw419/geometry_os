; DESCRIPTION: Renders a blue line between points (277, 137) and (351, 41).
; PLAN: r0=277(x1), r1=137(y1), r2=351(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 137
LDI r2, 351
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
