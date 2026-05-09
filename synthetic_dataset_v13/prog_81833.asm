; DESCRIPTION: Draws a black rectangle at (336, 122) with width 47 and height 23.
; PLAN: r0=336(x), r1=122(y), r2=47(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 122
LDI r2, 47
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
