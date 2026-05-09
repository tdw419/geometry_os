; DESCRIPTION: Composite: Sets a single white pixel at (495, 11) then Places a white 98x96 rectangle at position (145, 18).
; PLAN: r0=495(x), r1=11(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=18(y), r7=98(width), r8=96(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 495
LDI r1, 11
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 145
LDI r6, 18
LDI r7, 98
LDI r8, 96
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
