; DESCRIPTION: Composite: Sets a single black pixel at (154, 97) then Renders a black line between points (429, 11) and (364, 115).
; PLAN: r0=154(x), r1=97(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=429(x1), r6=11(y1), r7=364(x2), r8=115(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 97
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 429
LDI r6, 11
LDI r7, 364
LDI r8, 115
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
