; DESCRIPTION: Draws a black rectangle at (261, 32) with width 109 and height 119.
; PLAN: r0=261(x), r1=32(y), r2=109(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 32
LDI r2, 109
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
