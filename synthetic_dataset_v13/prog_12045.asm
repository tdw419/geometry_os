; DESCRIPTION: Draws a magenta rectangle at (54, 134) with width 22 and height 12.
; PLAN: r0=54(x), r1=134(y), r2=22(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 134
LDI r2, 22
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
