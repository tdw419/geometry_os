; DESCRIPTION: Composite: Sets a single orange pixel at (150, 20) then Draws a orange circle centered at (186, 143) with radius 50.
; PLAN: r0=150(x), r1=20(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=143(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 150
LDI r1, 20
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 186
LDI r6, 143
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
