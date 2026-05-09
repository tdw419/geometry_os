; DESCRIPTION: Draws a black rectangle at (250, 29) with width 23 and height 67.
; PLAN: r0=250(x), r1=29(y), r2=23(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 29
LDI r2, 23
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
