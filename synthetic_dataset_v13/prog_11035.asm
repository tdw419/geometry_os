; DESCRIPTION: Draws a magenta rectangle at (324, 117) with width 88 and height 61.
; PLAN: r0=324(x), r1=117(y), r2=88(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 117
LDI r2, 88
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
