; DESCRIPTION: Draws a magenta rectangle at (111, 38) with width 81 and height 19.
; PLAN: r0=111(x), r1=38(y), r2=81(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 38
LDI r2, 81
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
