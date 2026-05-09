; DESCRIPTION: Draws a red rectangle at (58, 122) with width 29 and height 30.
; PLAN: r0=58(x), r1=122(y), r2=29(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 122
LDI r2, 29
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
