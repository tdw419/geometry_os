; DESCRIPTION: Composite: Sets a single red pixel at (297, 175) then Draws a orange circle centered at (295, 119) with radius 35.
; PLAN: r0=297(x), r1=175(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=119(y), r7=35(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 297
LDI r1, 175
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 295
LDI r6, 119
LDI r7, 35
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
