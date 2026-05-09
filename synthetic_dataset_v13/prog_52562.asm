; DESCRIPTION: Draws a black rectangle at (244, 29) with width 85 and height 110.
; PLAN: r0=244(x), r1=29(y), r2=85(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 29
LDI r2, 85
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
