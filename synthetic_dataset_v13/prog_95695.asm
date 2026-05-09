; DESCRIPTION: Composite: Places a black dot at position (56, 118) then Draws a magenta rectangle at (134, 158) with width 58 and height 93.
; PLAN: r0=56(x), r1=118(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=134(x), r6=158(y), r7=58(width), r8=93(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 56
LDI r1, 118
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 134
LDI r6, 158
LDI r7, 58
LDI r8, 93
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
