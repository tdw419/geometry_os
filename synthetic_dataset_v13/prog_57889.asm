; DESCRIPTION: Composite: Sets a single cyan pixel at (4, 0) then Places a black 81x108 rectangle at position (315, 45).
; PLAN: r0=4(x), r1=0(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=315(x), r6=45(y), r7=81(width), r8=108(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 0
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 315
LDI r6, 45
LDI r7, 81
LDI r8, 108
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
