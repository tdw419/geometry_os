; DESCRIPTION: Composite: Places a red 90x15 rectangle at position (311, 85) then Sets a single blue pixel at (127, 166).
; PLAN: r0=311(x), r1=85(y), r2=90(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=166(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 85
LDI r2, 90
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 166
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
