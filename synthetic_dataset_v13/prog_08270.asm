; DESCRIPTION: Draws a magenta rectangle at (3, 178) with width 16 and height 29.
; PLAN: r0=3(x), r1=178(y), r2=16(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 178
LDI r2, 16
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
