; DESCRIPTION: Draws a magenta rectangle at (39, 50) with width 10 and height 106.
; PLAN: r0=39(x), r1=50(y), r2=10(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 50
LDI r2, 10
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
