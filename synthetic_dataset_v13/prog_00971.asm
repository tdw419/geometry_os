; DESCRIPTION: Composite: Sets a single black pixel at (263, 111) then Creates a green circular shape at (137, 135) with radius 73.
; PLAN: r0=263(x), r1=111(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=135(y), r7=73(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 111
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 137
LDI r6, 135
LDI r7, 73
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
