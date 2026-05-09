; DESCRIPTION: Composite: Places a blue dot at position (381, 30) then Draws a magenta rectangle at (168, 79) with width 90 and height 81.
; PLAN: r0=381(x), r1=30(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=168(x), r6=79(y), r7=90(width), r8=81(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 30
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 168
LDI r6, 79
LDI r7, 90
LDI r8, 81
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
