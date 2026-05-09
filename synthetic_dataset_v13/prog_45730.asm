; DESCRIPTION: Draws a magenta rectangle at (473, 84) with width 32 and height 117.
; PLAN: r0=473(x), r1=84(y), r2=32(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 84
LDI r2, 32
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
