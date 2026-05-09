; DESCRIPTION: Composite: Sets a single black pixel at (137, 125) then Renders a black line between points (52, 238) and (439, 55).
; PLAN: r0=137(x), r1=125(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=52(x1), r6=238(y1), r7=439(x2), r8=55(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 125
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 52
LDI r6, 238
LDI r7, 439
LDI r8, 55
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
