; DESCRIPTION: Draws a magenta rectangle at (327, 131) with width 79 and height 39.
; PLAN: r0=327(x), r1=131(y), r2=79(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 131
LDI r2, 79
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
