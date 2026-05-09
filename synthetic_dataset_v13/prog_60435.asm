; DESCRIPTION: Composite: Sets a single purple pixel at (397, 122) then Draws a green rectangle at (265, 28) with width 63 and height 85.
; PLAN: r0=397(x), r1=122(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=265(x), r6=28(y), r7=63(width), r8=85(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 122
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 265
LDI r6, 28
LDI r7, 63
LDI r8, 85
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
