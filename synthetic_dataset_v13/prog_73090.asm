; DESCRIPTION: Renders a green line between points (41, 234) and (331, 211).
; PLAN: r0=41(x1), r1=234(y1), r2=331(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 234
LDI r2, 331
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
