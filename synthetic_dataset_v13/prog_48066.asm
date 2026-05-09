; DESCRIPTION: Draws a black rectangle at (366, 73) with width 104 and height 114.
; PLAN: r0=366(x), r1=73(y), r2=104(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 73
LDI r2, 104
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
