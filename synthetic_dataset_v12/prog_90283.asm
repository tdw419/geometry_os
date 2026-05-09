; DESCRIPTION: Draws a magenta rectangle at (381, 128) with width 112 and height 110.
; PLAN: r0=381(x), r1=128(y), r2=112(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 128
LDI r2, 112
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
