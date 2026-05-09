; DESCRIPTION: Composite: Sets a single white pixel at (90, 155) then Places a green 57x13 rectangle at position (309, 224).
; PLAN: r0=90(x), r1=155(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=224(y), r7=57(width), r8=13(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 155
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 224
LDI r7, 57
LDI r8, 13
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
