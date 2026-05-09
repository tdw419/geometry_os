; DESCRIPTION: Composite: Sets a single blue pixel at (280, 254) then Draws a magenta rectangle at (196, 5) with width 66 and height 117.
; PLAN: r0=280(x), r1=254(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=196(x), r6=5(y), r7=66(width), r8=117(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 254
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 5
LDI r7, 66
LDI r8, 117
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
