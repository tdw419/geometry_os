; DESCRIPTION: Draws a magenta rectangle at (307, 15) with width 61 and height 108.
; PLAN: r0=307(x), r1=15(y), r2=61(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 15
LDI r2, 61
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
