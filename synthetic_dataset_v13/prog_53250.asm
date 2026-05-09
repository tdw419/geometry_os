; DESCRIPTION: Draws a magenta rectangle at (39, 92) with width 115 and height 56.
; PLAN: r0=39(x), r1=92(y), r2=115(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 92
LDI r2, 115
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
