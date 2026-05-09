; DESCRIPTION: Draws a black rectangle at (412, 84) with width 78 and height 60.
; PLAN: r0=412(x), r1=84(y), r2=78(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 84
LDI r2, 78
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
