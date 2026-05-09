; DESCRIPTION: Draws a black rectangle at (125, 11) with width 78 and height 34.
; PLAN: r0=125(x), r1=11(y), r2=78(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 11
LDI r2, 78
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
