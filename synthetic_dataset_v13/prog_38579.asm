; DESCRIPTION: Draws a magenta rectangle at (379, 131) with width 105 and height 80.
; PLAN: r0=379(x), r1=131(y), r2=105(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 131
LDI r2, 105
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
