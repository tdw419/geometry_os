; DESCRIPTION: Draws a magenta rectangle at (121, 109) with width 74 and height 13.
; PLAN: r0=121(x), r1=109(y), r2=74(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 109
LDI r2, 74
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
