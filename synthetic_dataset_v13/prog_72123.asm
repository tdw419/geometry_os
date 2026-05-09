; DESCRIPTION: Composite: Sets a single purple pixel at (461, 61) then Renders a white box of size 76x44 starting at (338, 192).
; PLAN: r0=461(x), r1=61(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=338(x), r6=192(y), r7=76(width), r8=44(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 61
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 338
LDI r6, 192
LDI r7, 76
LDI r8, 44
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
