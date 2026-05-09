; DESCRIPTION: Draws a magenta rectangle at (378, 3) with width 92 and height 28.
; PLAN: r0=378(x), r1=3(y), r2=92(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 3
LDI r2, 92
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
