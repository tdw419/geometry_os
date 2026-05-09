; DESCRIPTION: Draws a magenta rectangle at (120, 92) with width 64 and height 117.
; PLAN: r0=120(x), r1=92(y), r2=64(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 92
LDI r2, 64
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
