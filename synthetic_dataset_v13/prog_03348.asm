; DESCRIPTION: Draws a magenta rectangle at (434, 156) with width 56 and height 64.
; PLAN: r0=434(x), r1=156(y), r2=56(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 156
LDI r2, 56
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
