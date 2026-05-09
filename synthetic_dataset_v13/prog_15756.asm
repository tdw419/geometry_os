; DESCRIPTION: Composite: Places a purple dot at position (298, 182) then Renders a black line between points (52, 65) and (29, 201).
; PLAN: r0=298(x), r1=182(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=52(x1), r6=65(y1), r7=29(x2), r8=201(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 182
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 65
LDI r7, 29
LDI r8, 201
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
