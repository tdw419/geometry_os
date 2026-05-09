; DESCRIPTION: Composite: Sets a single red pixel at (415, 93) then Creates a blue circular shape at (415, 167) with radius 35.
; PLAN: r0=415(x), r1=93(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=167(y), r7=35(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 415
LDI r1, 93
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 415
LDI r6, 167
LDI r7, 35
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
