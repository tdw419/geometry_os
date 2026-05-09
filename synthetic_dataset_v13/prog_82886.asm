; DESCRIPTION: Composite: Sets a single cyan pixel at (501, 230) then Places a red 38x74 rectangle at position (441, 115).
; PLAN: r0=501(x), r1=230(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=441(x), r6=115(y), r7=38(width), r8=74(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 501
LDI r1, 230
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 441
LDI r6, 115
LDI r7, 38
LDI r8, 74
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
