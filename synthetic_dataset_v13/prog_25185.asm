; DESCRIPTION: Composite: Sets a single cyan pixel at (423, 75) then Draws a blue circle centered at (105, 115) with radius 72.
; PLAN: r0=423(x), r1=75(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=115(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 423
LDI r1, 75
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 105
LDI r6, 115
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
