; DESCRIPTION: Composite: Sets a single white pixel at (103, 19) then Renders a red line between points (29, 158) and (493, 18).
; PLAN: r0=103(x), r1=19(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=29(x1), r6=158(y1), r7=493(x2), r8=18(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 19
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 29
LDI r6, 158
LDI r7, 493
LDI r8, 18
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
