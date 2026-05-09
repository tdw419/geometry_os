; DESCRIPTION: Composite: Sets a single yellow pixel at (222, 4) then Renders a yellow disk with center (348, 148) and radius 64.
; PLAN: r0=222(x), r1=4(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=348(x), r6=148(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 222
LDI r1, 4
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 348
LDI r6, 148
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
