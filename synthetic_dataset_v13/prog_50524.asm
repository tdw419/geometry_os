; DESCRIPTION: Composite: Sets a single red pixel at (399, 115) then Renders a red line between points (444, 45) and (184, 69).
; PLAN: r0=399(x), r1=115(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=444(x1), r6=45(y1), r7=184(x2), r8=69(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 115
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 444
LDI r6, 45
LDI r7, 184
LDI r8, 69
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
