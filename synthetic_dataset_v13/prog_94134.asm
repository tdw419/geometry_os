; DESCRIPTION: Draws a black rectangle at (125, 56) with width 62 and height 47.
; PLAN: r0=125(x), r1=56(y), r2=62(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 56
LDI r2, 62
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
