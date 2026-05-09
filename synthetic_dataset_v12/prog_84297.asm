; DESCRIPTION: Draws a magenta rectangle at (64, 79) with width 69 and height 110.
; PLAN: r0=64(x), r1=79(y), r2=69(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 79
LDI r2, 69
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
