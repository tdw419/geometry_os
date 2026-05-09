; DESCRIPTION: Composite: Sets a single orange pixel at (268, 37) then Places a orange 83x82 rectangle at position (267, 99).
; PLAN: r0=268(x), r1=37(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=267(x), r6=99(y), r7=83(width), r8=82(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 37
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 267
LDI r6, 99
LDI r7, 83
LDI r8, 82
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
