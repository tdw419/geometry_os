; DESCRIPTION: Composite: Places a red dot at position (393, 190) then Draws a black rectangle at (304, 36) with width 21 and height 118.
; PLAN: r0=393(x), r1=190(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=304(x), r6=36(y), r7=21(width), r8=118(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 190
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 304
LDI r6, 36
LDI r7, 21
LDI r8, 118
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
