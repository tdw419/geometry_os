; DESCRIPTION: Draws a magenta rectangle at (274, 53) with width 84 and height 16.
; PLAN: r0=274(x), r1=53(y), r2=84(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 53
LDI r2, 84
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
