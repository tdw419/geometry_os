; DESCRIPTION: Draws a magenta rectangle at (339, 2) with width 93 and height 80.
; PLAN: r0=339(x), r1=2(y), r2=93(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 2
LDI r2, 93
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
