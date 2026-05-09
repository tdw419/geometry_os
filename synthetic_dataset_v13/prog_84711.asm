; DESCRIPTION: Draws a magenta rectangle at (345, 1) with width 49 and height 53.
; PLAN: r0=345(x), r1=1(y), r2=49(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 1
LDI r2, 49
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
