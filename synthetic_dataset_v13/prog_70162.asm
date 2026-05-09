; DESCRIPTION: Composite: Sets a single cyan pixel at (203, 233) then Places a magenta 26x27 rectangle at position (42, 34).
; PLAN: r0=203(x), r1=233(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=34(y), r7=26(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 233
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 34
LDI r7, 26
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
