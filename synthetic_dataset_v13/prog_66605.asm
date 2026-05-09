; DESCRIPTION: Composite: Renders a white disk with center (344, 204) and radius 14 then Sets a single white pixel at (287, 57).
; PLAN: r0=344(x), r1=204(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x), r6=57(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 344
LDI r1, 204
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 57
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
