; DESCRIPTION: Draws a black rectangle at (117, 121) with width 45 and height 88.
; PLAN: r0=117(x), r1=121(y), r2=45(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 121
LDI r2, 45
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
