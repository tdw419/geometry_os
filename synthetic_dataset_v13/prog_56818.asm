; DESCRIPTION: Composite: Sets a single green pixel at (78, 5) then Places a white 111x85 rectangle at position (124, 79).
; PLAN: r0=78(x), r1=5(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=79(y), r7=111(width), r8=85(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 5
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 124
LDI r6, 79
LDI r7, 111
LDI r8, 85
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
