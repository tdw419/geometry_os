; DESCRIPTION: Draws a magenta rectangle at (84, 164) with width 109 and height 49.
; PLAN: r0=84(x), r1=164(y), r2=109(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 164
LDI r2, 109
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
