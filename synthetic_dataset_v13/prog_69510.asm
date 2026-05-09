; DESCRIPTION: Composite: Sets a single purple pixel at (134, 236) then Creates a white rectangular region at (341, 122) spanning 19 by 19 pixels.
; PLAN: r0=134(x), r1=236(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=122(y), r7=19(width), r8=19(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 236
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 341
LDI r6, 122
LDI r7, 19
LDI r8, 19
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
