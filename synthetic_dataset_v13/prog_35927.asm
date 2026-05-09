; DESCRIPTION: Draws a magenta rectangle at (238, 50) with width 15 and height 75.
; PLAN: r0=238(x), r1=50(y), r2=15(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 50
LDI r2, 15
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
