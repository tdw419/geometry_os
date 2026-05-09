; DESCRIPTION: Composite: Sets a single black pixel at (339, 205) then Places a purple 104x95 rectangle at position (3, 57).
; PLAN: r0=339(x), r1=205(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=3(x), r6=57(y), r7=104(width), r8=95(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 205
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 3
LDI r6, 57
LDI r7, 104
LDI r8, 95
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
