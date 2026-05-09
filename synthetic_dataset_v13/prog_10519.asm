; DESCRIPTION: Draws a magenta rectangle at (346, 86) with width 111 and height 81.
; PLAN: r0=346(x), r1=86(y), r2=111(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 86
LDI r2, 111
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
