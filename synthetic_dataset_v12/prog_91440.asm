; DESCRIPTION: Draws a magenta rectangle at (358, 60) with width 36 and height 96.
; PLAN: r0=358(x), r1=60(y), r2=36(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 60
LDI r2, 36
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
