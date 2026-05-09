; DESCRIPTION: Renders a black line between points (17, 5) and (275, 155).
; PLAN: r0=17(x1), r1=5(y1), r2=275(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 5
LDI r2, 275
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
