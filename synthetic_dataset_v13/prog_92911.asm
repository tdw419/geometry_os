; DESCRIPTION: Composite: Sets a single red pixel at (338, 50) then Places a white 60x23 rectangle at position (19, 28).
; PLAN: r0=338(x), r1=50(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=28(y), r7=60(width), r8=23(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 50
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 19
LDI r6, 28
LDI r7, 60
LDI r8, 23
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
