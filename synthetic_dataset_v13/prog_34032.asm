; DESCRIPTION: Draws a magenta rectangle at (334, 35) with width 115 and height 22.
; PLAN: r0=334(x), r1=35(y), r2=115(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 35
LDI r2, 115
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
