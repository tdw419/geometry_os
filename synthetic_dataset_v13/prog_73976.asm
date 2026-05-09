; DESCRIPTION: Draws a magenta rectangle at (165, 43) with width 24 and height 16.
; PLAN: r0=165(x), r1=43(y), r2=24(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 43
LDI r2, 24
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
