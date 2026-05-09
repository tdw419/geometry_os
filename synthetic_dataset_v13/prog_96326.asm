; DESCRIPTION: Composite: Places a cyan dot at position (292, 182) then Places a red 53x102 rectangle at position (354, 151).
; PLAN: r0=292(x), r1=182(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=354(x), r6=151(y), r7=53(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 182
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 354
LDI r6, 151
LDI r7, 53
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
