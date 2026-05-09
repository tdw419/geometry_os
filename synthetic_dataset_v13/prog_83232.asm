; DESCRIPTION: Composite: Sets a single black pixel at (393, 199) then Places a red 96x102 rectangle at position (223, 90).
; PLAN: r0=393(x), r1=199(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=90(y), r7=96(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 199
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 223
LDI r6, 90
LDI r7, 96
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
