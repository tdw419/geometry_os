; DESCRIPTION: Draws a magenta rectangle at (350, 24) with width 64 and height 53.
; PLAN: r0=350(x), r1=24(y), r2=64(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 24
LDI r2, 64
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
