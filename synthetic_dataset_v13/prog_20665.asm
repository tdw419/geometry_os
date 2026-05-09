; DESCRIPTION: Composite: Sets a single black pixel at (357, 142) then Draws a white circle centered at (80, 90) with radius 75.
; PLAN: r0=357(x), r1=142(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=90(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 357
LDI r1, 142
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 80
LDI r6, 90
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
