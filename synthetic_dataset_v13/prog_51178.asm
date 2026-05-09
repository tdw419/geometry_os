; DESCRIPTION: Draws a black rectangle at (291, 76) with width 104 and height 115.
; PLAN: r0=291(x), r1=76(y), r2=104(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 76
LDI r2, 104
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
