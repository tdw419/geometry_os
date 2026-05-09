; DESCRIPTION: Draws a magenta rectangle at (61, 18) with width 98 and height 69.
; PLAN: r0=61(x), r1=18(y), r2=98(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 18
LDI r2, 98
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
