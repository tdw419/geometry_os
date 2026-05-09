; DESCRIPTION: Composite: Renders a white line between points (5, 119) and (186, 222) then Sets a single red pixel at (326, 194).
; PLAN: r0=5(x1), r1=119(y1), r2=186(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=194(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 5
LDI r1, 119
LDI r2, 186
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 194
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
