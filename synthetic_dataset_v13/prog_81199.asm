; DESCRIPTION: Composite: Sets a single white pixel at (417, 45) then Renders a yellow line between points (51, 72) and (142, 241).
; PLAN: r0=417(x), r1=45(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=51(x1), r6=72(y1), r7=142(x2), r8=241(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 45
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 51
LDI r6, 72
LDI r7, 142
LDI r8, 241
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
