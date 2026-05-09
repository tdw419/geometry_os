; DESCRIPTION: Draws a magenta rectangle at (5, 70) with width 63 and height 95.
; PLAN: r0=5(x), r1=70(y), r2=63(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 70
LDI r2, 63
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
