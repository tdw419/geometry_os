; DESCRIPTION: Draws a magenta rectangle at (338, 130) with width 115 and height 66.
; PLAN: r0=338(x), r1=130(y), r2=115(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 130
LDI r2, 115
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
