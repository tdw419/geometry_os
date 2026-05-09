; DESCRIPTION: Draws a magenta rectangle at (98, 69) with width 100 and height 110.
; PLAN: r0=98(x), r1=69(y), r2=100(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 69
LDI r2, 100
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
