; DESCRIPTION: Draws a magenta rectangle at (78, 130) with width 117 and height 105.
; PLAN: r0=78(x), r1=130(y), r2=117(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 130
LDI r2, 117
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
