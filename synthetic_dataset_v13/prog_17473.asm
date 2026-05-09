; DESCRIPTION: Composite: Sets a single green pixel at (286, 29) then Renders a black line between points (478, 115) and (94, 217).
; PLAN: r0=286(x), r1=29(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=478(x1), r6=115(y1), r7=94(x2), r8=217(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 29
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 478
LDI r6, 115
LDI r7, 94
LDI r8, 217
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
