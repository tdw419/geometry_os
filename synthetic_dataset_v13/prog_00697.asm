; DESCRIPTION: Draws a magenta rectangle at (50, 134) with width 20 and height 118.
; PLAN: r0=50(x), r1=134(y), r2=20(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 134
LDI r2, 20
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
