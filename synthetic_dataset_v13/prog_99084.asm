; DESCRIPTION: Draws a magenta rectangle at (100, 18) with width 19 and height 20.
; PLAN: r0=100(x), r1=18(y), r2=19(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 18
LDI r2, 19
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
