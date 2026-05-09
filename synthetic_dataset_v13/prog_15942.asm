; DESCRIPTION: Draws a magenta rectangle at (441, 86) with width 28 and height 73.
; PLAN: r0=441(x), r1=86(y), r2=28(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 86
LDI r2, 28
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
