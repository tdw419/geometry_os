; DESCRIPTION: Composite: Sets a single orange pixel at (481, 159) then Renders a orange line between points (65, 112) and (46, 2).
; PLAN: r0=481(x), r1=159(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=65(x1), r6=112(y1), r7=46(x2), r8=2(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 481
LDI r1, 159
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 65
LDI r6, 112
LDI r7, 46
LDI r8, 2
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
