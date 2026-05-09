; DESCRIPTION: Renders a black line between points (95, 191) and (438, 203).
; PLAN: r0=95(x1), r1=191(y1), r2=438(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 191
LDI r2, 438
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
