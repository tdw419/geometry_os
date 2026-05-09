; DESCRIPTION: Composite: Renders a white line between points (441, 166) and (109, 119) then Sets a single yellow pixel at (178, 43).
; PLAN: r0=441(x1), r1=166(y1), r2=109(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=43(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 441
LDI r1, 166
LDI r2, 109
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 43
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
