; DESCRIPTION: Draws a magenta rectangle at (69, 4) with width 22 and height 28.
; PLAN: r0=69(x), r1=4(y), r2=22(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 4
LDI r2, 22
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
