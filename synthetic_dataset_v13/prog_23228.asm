; DESCRIPTION: Composite: Sets a single purple pixel at (217, 103) then Draws a orange circle centered at (162, 145) with radius 41.
; PLAN: r0=217(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=145(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 217
LDI r1, 103
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 145
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
