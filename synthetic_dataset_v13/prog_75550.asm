; DESCRIPTION: Draws a magenta rectangle at (76, 128) with width 37 and height 101.
; PLAN: r0=76(x), r1=128(y), r2=37(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 128
LDI r2, 37
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
