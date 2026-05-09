; DESCRIPTION: Draws a magenta rectangle at (90, 130) with width 101 and height 102.
; PLAN: r0=90(x), r1=130(y), r2=101(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 130
LDI r2, 101
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
