; DESCRIPTION: Draws a magenta rectangle at (3, 238) with width 100 and height 11.
; PLAN: r0=3(x), r1=238(y), r2=100(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 238
LDI r2, 100
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
