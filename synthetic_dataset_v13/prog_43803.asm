; DESCRIPTION: Draws a magenta rectangle at (349, 154) with width 69 and height 43.
; PLAN: r0=349(x), r1=154(y), r2=69(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 154
LDI r2, 69
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
