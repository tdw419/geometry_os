; DESCRIPTION: Draws a magenta rectangle at (131, 60) with width 111 and height 62.
; PLAN: r0=131(x), r1=60(y), r2=111(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 60
LDI r2, 111
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
