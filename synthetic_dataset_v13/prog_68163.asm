; DESCRIPTION: Draws a magenta rectangle at (259, 40) with width 108 and height 102.
; PLAN: r0=259(x), r1=40(y), r2=108(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 40
LDI r2, 108
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
