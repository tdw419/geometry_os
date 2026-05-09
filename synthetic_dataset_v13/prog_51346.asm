; DESCRIPTION: Composite: Sets a single cyan pixel at (265, 150) then Draws a white rectangle at (196, 183) with width 68 and height 67.
; PLAN: r0=265(x), r1=150(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=196(x), r6=183(y), r7=68(width), r8=67(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 150
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 183
LDI r7, 68
LDI r8, 67
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
