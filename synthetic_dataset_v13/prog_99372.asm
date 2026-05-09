; DESCRIPTION: Draws a black rectangle at (105, 175) with width 40 and height 78.
; PLAN: r0=105(x), r1=175(y), r2=40(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 175
LDI r2, 40
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
