; DESCRIPTION: Draws a magenta rectangle at (91, 131) with width 84 and height 75.
; PLAN: r0=91(x), r1=131(y), r2=84(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 131
LDI r2, 84
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
