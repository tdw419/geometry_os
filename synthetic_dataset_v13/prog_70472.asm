; DESCRIPTION: Draws a black rectangle at (121, 83) with width 38 and height 76.
; PLAN: r0=121(x), r1=83(y), r2=38(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 83
LDI r2, 38
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
