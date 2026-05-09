; DESCRIPTION: Draws a red rectangle at (397, 122) with width 80 and height 88.
; PLAN: r0=397(x), r1=122(y), r2=80(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 122
LDI r2, 80
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
