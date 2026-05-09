; DESCRIPTION: Renders a black line between points (506, 9) and (266, 20).
; PLAN: r0=506(x1), r1=9(y1), r2=266(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 9
LDI r2, 266
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
