; DESCRIPTION: Draws a magenta rectangle at (291, 92) with width 20 and height 103.
; PLAN: r0=291(x), r1=92(y), r2=20(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 92
LDI r2, 20
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
