; DESCRIPTION: Draws a magenta rectangle at (418, 40) with width 34 and height 116.
; PLAN: r0=418(x), r1=40(y), r2=34(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 40
LDI r2, 34
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
