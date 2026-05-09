; DESCRIPTION: Composite: Sets a single purple pixel at (100, 255) then Draws a white circle centered at (318, 151) with radius 10.
; PLAN: r0=100(x), r1=255(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=151(y), r7=10(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 100
LDI r1, 255
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 318
LDI r6, 151
LDI r7, 10
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
