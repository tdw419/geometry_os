; DESCRIPTION: Draws a magenta rectangle at (300, 97) with width 26 and height 24.
; PLAN: r0=300(x), r1=97(y), r2=26(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 97
LDI r2, 26
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
