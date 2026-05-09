; DESCRIPTION: Composite: Sets a single blue pixel at (318, 224) then Places a green 66x52 rectangle at position (341, 98).
; PLAN: r0=318(x), r1=224(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=98(y), r7=66(width), r8=52(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 224
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 341
LDI r6, 98
LDI r7, 66
LDI r8, 52
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
