; DESCRIPTION: Composite: Sets a single green pixel at (43, 57) then Places a magenta 82x77 rectangle at position (264, 67).
; PLAN: r0=43(x), r1=57(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=67(y), r7=82(width), r8=77(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 57
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 264
LDI r6, 67
LDI r7, 82
LDI r8, 77
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
