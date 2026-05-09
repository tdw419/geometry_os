; DESCRIPTION: Composite: Sets a single black pixel at (392, 178) then Places a red 66x101 rectangle at position (309, 37).
; PLAN: r0=392(x), r1=178(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=37(y), r7=66(width), r8=101(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 178
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 309
LDI r6, 37
LDI r7, 66
LDI r8, 101
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
