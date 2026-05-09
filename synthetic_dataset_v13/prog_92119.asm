; DESCRIPTION: Renders a black line between points (318, 66) and (203, 98).
; PLAN: r0=318(x1), r1=66(y1), r2=203(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 66
LDI r2, 203
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
