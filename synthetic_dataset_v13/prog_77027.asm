; DESCRIPTION: Draws a magenta rectangle at (44, 69) with width 65 and height 110.
; PLAN: r0=44(x), r1=69(y), r2=65(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 69
LDI r2, 65
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
