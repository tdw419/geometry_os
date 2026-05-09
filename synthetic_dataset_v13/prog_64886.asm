; DESCRIPTION: Draws a magenta rectangle at (279, 76) with width 89 and height 61.
; PLAN: r0=279(x), r1=76(y), r2=89(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 76
LDI r2, 89
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
