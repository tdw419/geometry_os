; DESCRIPTION: Composite: Sets a single purple pixel at (195, 43) then Draws a white line from (118, 88) to (51, 109).
; PLAN: r0=195(x), r1=43(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=118(x1), r6=88(y1), r7=51(x2), r8=109(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 43
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 118
LDI r6, 88
LDI r7, 51
LDI r8, 109
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
