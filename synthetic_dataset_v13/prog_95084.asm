; DESCRIPTION: Draws a magenta rectangle at (391, 145) with width 35 and height 69.
; PLAN: r0=391(x), r1=145(y), r2=35(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 145
LDI r2, 35
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
