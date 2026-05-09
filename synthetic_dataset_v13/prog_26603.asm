; DESCRIPTION: Draws a black rectangle at (412, 13) with width 84 and height 17.
; PLAN: r0=412(x), r1=13(y), r2=84(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 13
LDI r2, 84
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
