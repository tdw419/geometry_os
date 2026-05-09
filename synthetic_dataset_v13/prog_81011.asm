; DESCRIPTION: Renders a black line between points (223, 45) and (17, 39).
; PLAN: r0=223(x1), r1=45(y1), r2=17(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 45
LDI r2, 17
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
