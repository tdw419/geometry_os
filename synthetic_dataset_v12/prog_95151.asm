; DESCRIPTION: Composite: Sets a single blue pixel at (362, 162) then Draws a magenta rectangle at (347, 177) with width 21 and height 74.
; PLAN: r0=362(x), r1=162(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=347(x), r6=177(y), r7=21(width), r8=74(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 362
LDI r1, 162
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 347
LDI r6, 177
LDI r7, 21
LDI r8, 74
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
