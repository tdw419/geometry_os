; DESCRIPTION: Draws a magenta rectangle at (36, 131) with width 117 and height 119.
; PLAN: r0=36(x), r1=131(y), r2=117(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 131
LDI r2, 117
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
