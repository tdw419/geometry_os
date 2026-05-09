; DESCRIPTION: Composite: Sets a single purple pixel at (112, 0) then Creates a white circular shape at (415, 81) with radius 43.
; PLAN: r0=112(x), r1=0(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=81(y), r7=43(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 112
LDI r1, 0
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 415
LDI r6, 81
LDI r7, 43
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
