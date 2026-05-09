; DESCRIPTION: Draws a magenta rectangle at (162, 60) with width 29 and height 10.
; PLAN: r0=162(x), r1=60(y), r2=29(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 60
LDI r2, 29
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
