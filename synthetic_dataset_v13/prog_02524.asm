; DESCRIPTION: Composite: Sets a single blue pixel at (248, 74) then Draws a black rectangle at (168, 182) with width 47 and height 68.
; PLAN: r0=248(x), r1=74(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=168(x), r6=182(y), r7=47(width), r8=68(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 248
LDI r1, 74
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 168
LDI r6, 182
LDI r7, 47
LDI r8, 68
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
