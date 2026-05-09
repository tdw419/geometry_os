; DESCRIPTION: Composite: Sets a single green pixel at (299, 206) then Places a green 75x110 rectangle at position (348, 22).
; PLAN: r0=299(x), r1=206(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=348(x), r6=22(y), r7=75(width), r8=110(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 206
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 348
LDI r6, 22
LDI r7, 75
LDI r8, 110
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
