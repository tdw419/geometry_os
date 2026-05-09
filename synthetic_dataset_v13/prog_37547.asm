; DESCRIPTION: Draws a magenta rectangle at (378, 39) with width 64 and height 10.
; PLAN: r0=378(x), r1=39(y), r2=64(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 39
LDI r2, 64
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
