; DESCRIPTION: Draws a magenta rectangle at (353, 122) with width 56 and height 112.
; PLAN: r0=353(x), r1=122(y), r2=56(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 122
LDI r2, 56
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
