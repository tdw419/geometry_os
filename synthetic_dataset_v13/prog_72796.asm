; DESCRIPTION: Draws a magenta rectangle at (128, 63) with width 98 and height 112.
; PLAN: r0=128(x), r1=63(y), r2=98(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 63
LDI r2, 98
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
