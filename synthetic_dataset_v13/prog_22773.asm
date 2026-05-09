; DESCRIPTION: Draws a magenta rectangle at (382, 83) with width 14 and height 96.
; PLAN: r0=382(x), r1=83(y), r2=14(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 83
LDI r2, 14
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
