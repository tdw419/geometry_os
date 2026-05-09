; DESCRIPTION: Draws a magenta rectangle at (420, 158) with width 50 and height 40.
; PLAN: r0=420(x), r1=158(y), r2=50(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 158
LDI r2, 50
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
