; DESCRIPTION: Composite: Draws a magenta rectangle at (261, 12) with width 118 and height 102 then Places a magenta dot at position (26, 58).
; PLAN: r0=261(x), r1=12(y), r2=118(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=58(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 261
LDI r1, 12
LDI r2, 118
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 58
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
