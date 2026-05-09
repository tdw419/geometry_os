; DESCRIPTION: Draws a magenta rectangle at (28, 202) with width 66 and height 15.
; PLAN: r0=28(x), r1=202(y), r2=66(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 202
LDI r2, 66
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
