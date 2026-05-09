; DESCRIPTION: Composite: Sets a single red pixel at (384, 68) then Renders a white disk with center (285, 145) and radius 16.
; PLAN: r0=384(x), r1=68(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=145(y), r7=16(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 384
LDI r1, 68
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 285
LDI r6, 145
LDI r7, 16
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
