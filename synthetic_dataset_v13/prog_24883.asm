; DESCRIPTION: Draws a magenta rectangle at (418, 5) with width 78 and height 93.
; PLAN: r0=418(x), r1=5(y), r2=78(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 5
LDI r2, 78
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
