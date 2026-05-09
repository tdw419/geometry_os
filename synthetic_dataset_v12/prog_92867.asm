; DESCRIPTION: Composite: Sets a single red pixel at (428, 184) then Places a cyan circle of radius 20 at center (348, 182).
; PLAN: r0=428(x), r1=184(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=348(x), r6=182(y), r7=20(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 428
LDI r1, 184
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 348
LDI r6, 182
LDI r7, 20
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
