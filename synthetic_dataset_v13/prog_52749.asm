; DESCRIPTION: Draws a black rectangle at (462, 135) with width 38 and height 78.
; PLAN: r0=462(x), r1=135(y), r2=38(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 135
LDI r2, 38
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
