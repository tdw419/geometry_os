; DESCRIPTION: Composite: Sets a single red pixel at (474, 36) then Creates a magenta circular shape at (204, 149) with radius 35.
; PLAN: r0=474(x), r1=36(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=204(x), r6=149(y), r7=35(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 474
LDI r1, 36
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 204
LDI r6, 149
LDI r7, 35
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
