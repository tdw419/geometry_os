; DESCRIPTION: Draws a magenta rectangle at (50, 132) with width 26 and height 68.
; PLAN: r0=50(x), r1=132(y), r2=26(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 132
LDI r2, 26
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
