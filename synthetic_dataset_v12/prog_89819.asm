; DESCRIPTION: Draws a magenta rectangle at (191, 40) with width 102 and height 12.
; PLAN: r0=191(x), r1=40(y), r2=102(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 40
LDI r2, 102
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
