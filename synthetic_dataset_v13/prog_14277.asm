; DESCRIPTION: Draws a magenta rectangle at (327, 61) with width 73 and height 107.
; PLAN: r0=327(x), r1=61(y), r2=73(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 61
LDI r2, 73
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
