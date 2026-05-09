; DESCRIPTION: Composite: Sets a single blue pixel at (370, 245) then Draws a red rectangle at (329, 182) with width 24 and height 61.
; PLAN: r0=370(x), r1=245(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=329(x), r6=182(y), r7=24(width), r8=61(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 245
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 329
LDI r6, 182
LDI r7, 24
LDI r8, 61
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
