; DESCRIPTION: Composite: Sets a single orange pixel at (39, 217) then Renders a black line between points (296, 6) and (267, 5).
; PLAN: r0=39(x), r1=217(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=296(x1), r6=6(y1), r7=267(x2), r8=5(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 217
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 296
LDI r6, 6
LDI r7, 267
LDI r8, 5
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
