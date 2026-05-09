; DESCRIPTION: Draws a black rectangle at (366, 15) with width 33 and height 76.
; PLAN: r0=366(x), r1=15(y), r2=33(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 15
LDI r2, 33
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
