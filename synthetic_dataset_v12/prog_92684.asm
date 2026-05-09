; DESCRIPTION: Draws a magenta rectangle at (161, 102) with width 108 and height 66.
; PLAN: r0=161(x), r1=102(y), r2=108(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 102
LDI r2, 108
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
