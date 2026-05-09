; DESCRIPTION: Composite: Renders a white disk with center (364, 223) and radius 12 then Sets a single white pixel at (274, 121).
; PLAN: r0=364(x), r1=223(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x), r6=121(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 223
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 121
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
