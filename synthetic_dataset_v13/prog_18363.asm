; DESCRIPTION: Composite: Sets a single purple pixel at (480, 11) then Draws a orange circle centered at (65, 201) with radius 15.
; PLAN: r0=480(x), r1=11(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=65(x), r6=201(y), r7=15(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 480
LDI r1, 11
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 65
LDI r6, 201
LDI r7, 15
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
