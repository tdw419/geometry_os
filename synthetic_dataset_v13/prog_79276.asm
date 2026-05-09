; DESCRIPTION: Draws a magenta rectangle at (238, 166) with width 79 and height 51.
; PLAN: r0=238(x), r1=166(y), r2=79(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 166
LDI r2, 79
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
