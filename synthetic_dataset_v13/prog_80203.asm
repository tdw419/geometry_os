; DESCRIPTION: Draws a magenta rectangle at (261, 61) with width 34 and height 83.
; PLAN: r0=261(x), r1=61(y), r2=34(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 61
LDI r2, 34
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
