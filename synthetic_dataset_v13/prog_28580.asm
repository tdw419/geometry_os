; DESCRIPTION: Draws a magenta rectangle at (359, 24) with width 69 and height 50.
; PLAN: r0=359(x), r1=24(y), r2=69(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 24
LDI r2, 69
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
