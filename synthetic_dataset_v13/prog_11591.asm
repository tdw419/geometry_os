; DESCRIPTION: Draws a magenta rectangle at (72, 92) with width 100 and height 75.
; PLAN: r0=72(x), r1=92(y), r2=100(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 92
LDI r2, 100
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
