; DESCRIPTION: Composite: Places a black dot at position (478, 15) then Renders a cyan line between points (165, 176) and (102, 43).
; PLAN: r0=478(x), r1=15(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=165(x1), r6=176(y1), r7=102(x2), r8=43(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 478
LDI r1, 15
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 165
LDI r6, 176
LDI r7, 102
LDI r8, 43
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
