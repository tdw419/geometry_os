; DESCRIPTION: Draws a magenta rectangle at (418, 81) with width 36 and height 54.
; PLAN: r0=418(x), r1=81(y), r2=36(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 81
LDI r2, 36
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
