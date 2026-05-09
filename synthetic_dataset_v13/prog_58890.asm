; DESCRIPTION: Composite: Sets a single purple pixel at (230, 126) then Places a orange 67x26 rectangle at position (347, 165).
; PLAN: r0=230(x), r1=126(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=347(x), r6=165(y), r7=67(width), r8=26(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 126
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 347
LDI r6, 165
LDI r7, 67
LDI r8, 26
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
