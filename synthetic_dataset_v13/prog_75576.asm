; DESCRIPTION: Composite: Sets a single white pixel at (30, 134) then Places a yellow circle of radius 33 at center (428, 87).
; PLAN: r0=30(x), r1=134(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=428(x), r6=87(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 134
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 428
LDI r6, 87
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
