; DESCRIPTION: Composite: Sets a single yellow pixel at (445, 0) then Renders a white disk with center (338, 141) and radius 19.
; PLAN: r0=445(x), r1=0(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=338(x), r6=141(y), r7=19(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 445
LDI r1, 0
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 338
LDI r6, 141
LDI r7, 19
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
