; DESCRIPTION: Composite: Sets a single white pixel at (205, 95) then Renders a magenta disk with center (399, 227) and radius 12.
; PLAN: r0=205(x), r1=95(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=227(y), r7=12(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 205
LDI r1, 95
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 399
LDI r6, 227
LDI r7, 12
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
