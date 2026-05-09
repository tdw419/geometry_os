; DESCRIPTION: Composite: Sets a single green pixel at (275, 159) then Renders a white line between points (24, 30) and (115, 181).
; PLAN: r0=275(x), r1=159(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=24(x1), r6=30(y1), r7=115(x2), r8=181(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 159
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 24
LDI r6, 30
LDI r7, 115
LDI r8, 181
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
