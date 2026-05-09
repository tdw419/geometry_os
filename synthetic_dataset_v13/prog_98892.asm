; DESCRIPTION: Composite: Sets a single cyan pixel at (118, 170) then Draws a cyan rectangle at (227, 228) with width 28 and height 27.
; PLAN: r0=118(x), r1=170(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=228(y), r7=28(width), r8=27(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 170
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 228
LDI r7, 28
LDI r8, 27
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
