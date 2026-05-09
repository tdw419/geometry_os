; DESCRIPTION: Draws a magenta rectangle at (288, 69) with width 27 and height 110.
; PLAN: r0=288(x), r1=69(y), r2=27(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 69
LDI r2, 27
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
