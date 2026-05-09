; DESCRIPTION: Draws a magenta rectangle at (370, 141) with width 100 and height 76.
; PLAN: r0=370(x), r1=141(y), r2=100(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 141
LDI r2, 100
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
