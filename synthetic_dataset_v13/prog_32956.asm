; DESCRIPTION: Composite: Sets a single white pixel at (372, 9) then Renders a black disk with center (324, 181) and radius 10.
; PLAN: r0=372(x), r1=9(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=181(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 9
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 181
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
