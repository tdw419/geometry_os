; DESCRIPTION: Draws a magenta rectangle at (138, 3) with width 85 and height 117.
; PLAN: r0=138(x), r1=3(y), r2=85(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 3
LDI r2, 85
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
