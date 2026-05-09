; DESCRIPTION: Draws a magenta rectangle at (304, 76) with width 76 and height 89.
; PLAN: r0=304(x), r1=76(y), r2=76(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 76
LDI r2, 76
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
