; DESCRIPTION: Draws a magenta rectangle at (59, 102) with width 79 and height 51.
; PLAN: r0=59(x), r1=102(y), r2=79(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 102
LDI r2, 79
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
