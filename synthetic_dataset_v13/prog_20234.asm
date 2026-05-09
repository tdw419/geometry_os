; DESCRIPTION: Composite: Sets a single blue pixel at (20, 64) then Places a blue 44x52 rectangle at position (401, 199).
; PLAN: r0=20(x), r1=64(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=401(x), r6=199(y), r7=44(width), r8=52(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 20
LDI r1, 64
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 401
LDI r6, 199
LDI r7, 44
LDI r8, 52
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
