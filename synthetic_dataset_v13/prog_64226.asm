; DESCRIPTION: Draws a magenta rectangle at (350, 38) with width 69 and height 39.
; PLAN: r0=350(x), r1=38(y), r2=69(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 38
LDI r2, 69
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
