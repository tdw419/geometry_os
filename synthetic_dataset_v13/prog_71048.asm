; DESCRIPTION: Composite: Sets a single white pixel at (271, 46) then Places a white circle of radius 42 at center (348, 120).
; PLAN: r0=271(x), r1=46(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=348(x), r6=120(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 271
LDI r1, 46
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 348
LDI r6, 120
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
