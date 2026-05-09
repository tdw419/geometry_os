; DESCRIPTION: Composite: Renders a white disk with center (421, 25) and radius 17 then Sets a single white pixel at (372, 69).
; PLAN: r0=421(x), r1=25(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=69(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 25
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 69
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
