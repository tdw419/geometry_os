; DESCRIPTION: Composite: Sets a single magenta pixel at (378, 51) then Renders a white box of size 45x118 starting at (121, 70).
; PLAN: r0=378(x), r1=51(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=70(y), r7=45(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 51
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 121
LDI r6, 70
LDI r7, 45
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
