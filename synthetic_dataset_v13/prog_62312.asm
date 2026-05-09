; DESCRIPTION: Composite: Places a white dot at position (508, 93) then Places a cyan 26x49 rectangle at position (311, 93).
; PLAN: r0=508(x), r1=93(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=93(y), r7=26(width), r8=49(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 508
LDI r1, 93
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 311
LDI r6, 93
LDI r7, 26
LDI r8, 49
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
