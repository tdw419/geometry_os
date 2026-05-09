; DESCRIPTION: Composite: Places a red dot at position (154, 230) then Draws a green rectangle at (126, 36) with width 72 and height 53.
; PLAN: r0=154(x), r1=230(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=36(y), r7=72(width), r8=53(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 230
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 126
LDI r6, 36
LDI r7, 72
LDI r8, 53
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
