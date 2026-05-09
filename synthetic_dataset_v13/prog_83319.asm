; DESCRIPTION: Draws a magenta rectangle at (17, 63) with width 83 and height 30.
; PLAN: r0=17(x), r1=63(y), r2=83(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 63
LDI r2, 83
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
