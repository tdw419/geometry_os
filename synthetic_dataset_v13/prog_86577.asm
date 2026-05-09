; DESCRIPTION: Draws a magenta rectangle at (383, 39) with width 90 and height 116.
; PLAN: r0=383(x), r1=39(y), r2=90(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 39
LDI r2, 90
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
