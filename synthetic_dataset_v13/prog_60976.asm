; DESCRIPTION: Draws a black rectangle at (397, 91) with width 24 and height 35.
; PLAN: r0=397(x), r1=91(y), r2=24(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 91
LDI r2, 24
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
