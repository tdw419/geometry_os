; DESCRIPTION: Composite: Sets a single white pixel at (26, 2) then Places a blue circle of radius 63 at center (285, 181).
; PLAN: r0=26(x), r1=2(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=181(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 26
LDI r1, 2
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 285
LDI r6, 181
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
