; DESCRIPTION: Draws a black rectangle at (443, 122) with width 22 and height 43.
; PLAN: r0=443(x), r1=122(y), r2=22(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 122
LDI r2, 22
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
