; DESCRIPTION: Renders a black line between points (331, 70) and (122, 18).
; PLAN: r0=331(x1), r1=70(y1), r2=122(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 70
LDI r2, 122
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
