; DESCRIPTION: Draws a magenta rectangle at (87, 97) with width 35 and height 103.
; PLAN: r0=87(x), r1=97(y), r2=35(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 97
LDI r2, 35
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
