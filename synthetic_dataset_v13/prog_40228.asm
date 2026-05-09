; DESCRIPTION: Composite: Sets a single magenta pixel at (470, 206) then Creates a white circular shape at (239, 110) with radius 75.
; PLAN: r0=470(x), r1=206(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=110(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 470
LDI r1, 206
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 239
LDI r6, 110
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
