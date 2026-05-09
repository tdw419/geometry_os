; DESCRIPTION: Draws a magenta rectangle at (39, 60) with width 72 and height 107.
; PLAN: r0=39(x), r1=60(y), r2=72(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 60
LDI r2, 72
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
