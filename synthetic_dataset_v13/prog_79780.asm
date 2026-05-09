; DESCRIPTION: Composite: Sets a single red pixel at (288, 63) then Renders a red line between points (388, 94) and (24, 91).
; PLAN: r0=288(x), r1=63(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=388(x1), r6=94(y1), r7=24(x2), r8=91(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 63
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 388
LDI r6, 94
LDI r7, 24
LDI r8, 91
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
