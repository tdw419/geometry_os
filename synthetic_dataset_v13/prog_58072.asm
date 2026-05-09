; DESCRIPTION: Draws a magenta rectangle at (16, 106) with width 110 and height 113.
; PLAN: r0=16(x), r1=106(y), r2=110(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 106
LDI r2, 110
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
