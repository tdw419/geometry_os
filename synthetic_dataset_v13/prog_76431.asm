; DESCRIPTION: Draws a magenta rectangle at (7, 131) with width 116 and height 78.
; PLAN: r0=7(x), r1=131(y), r2=116(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 131
LDI r2, 116
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
