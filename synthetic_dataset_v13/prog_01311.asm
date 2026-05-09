; DESCRIPTION: Composite: Renders a black line between points (461, 52) and (347, 84) then Places a green dot at position (314, 168).
; PLAN: r0=461(x1), r1=52(y1), r2=347(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=168(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 461
LDI r1, 52
LDI r2, 347
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 168
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
