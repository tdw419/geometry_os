; DESCRIPTION: Renders a black line between points (55, 7) and (170, 130).
; PLAN: r0=55(x1), r1=7(y1), r2=170(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 7
LDI r2, 170
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
