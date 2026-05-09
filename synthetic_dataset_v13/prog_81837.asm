; DESCRIPTION: Draws a magenta rectangle at (10, 40) with width 115 and height 14.
; PLAN: r0=10(x), r1=40(y), r2=115(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 40
LDI r2, 115
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
