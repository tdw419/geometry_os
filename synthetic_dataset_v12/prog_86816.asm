; DESCRIPTION: Composite: Sets a single white pixel at (2, 111) then Places a red 57x85 rectangle at position (276, 42).
; PLAN: r0=2(x), r1=111(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=276(x), r6=42(y), r7=57(width), r8=85(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 111
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 276
LDI r6, 42
LDI r7, 57
LDI r8, 85
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
