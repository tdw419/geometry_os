; DESCRIPTION: Draws a magenta rectangle at (9, 3) with width 76 and height 117.
; PLAN: r0=9(x), r1=3(y), r2=76(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 3
LDI r2, 76
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
