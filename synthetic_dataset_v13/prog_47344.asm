; DESCRIPTION: Composite: Sets a single white pixel at (354, 211) then Places a blue 37x115 rectangle at position (461, 73).
; PLAN: r0=354(x), r1=211(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=461(x), r6=73(y), r7=37(width), r8=115(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 211
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 461
LDI r6, 73
LDI r7, 37
LDI r8, 115
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
