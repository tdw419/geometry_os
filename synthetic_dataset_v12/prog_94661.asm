; DESCRIPTION: Draws a magenta rectangle at (57, 63) with width 111 and height 116.
; PLAN: r0=57(x), r1=63(y), r2=111(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 63
LDI r2, 111
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
