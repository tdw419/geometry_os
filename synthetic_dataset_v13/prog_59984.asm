; DESCRIPTION: Draws a magenta rectangle at (28, 237) with width 84 and height 12.
; PLAN: r0=28(x), r1=237(y), r2=84(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 237
LDI r2, 84
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
