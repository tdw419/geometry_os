; DESCRIPTION: Composite: Sets a single purple pixel at (471, 31) then Places a purple 20x84 rectangle at position (244, 48).
; PLAN: r0=471(x), r1=31(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=244(x), r6=48(y), r7=20(width), r8=84(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 31
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 244
LDI r6, 48
LDI r7, 20
LDI r8, 84
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
