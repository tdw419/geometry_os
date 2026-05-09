; DESCRIPTION: Composite: Renders a white line between points (340, 169) and (5, 113) then Sets a single red pixel at (472, 79).
; PLAN: r0=340(x1), r1=169(y1), r2=5(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=79(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 340
LDI r1, 169
LDI r2, 5
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 79
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
