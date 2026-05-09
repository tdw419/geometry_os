; DESCRIPTION: Draws a magenta rectangle at (481, 77) with width 23 and height 14.
; PLAN: r0=481(x), r1=77(y), r2=23(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 77
LDI r2, 23
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
