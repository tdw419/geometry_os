; DESCRIPTION: Draws a black rectangle at (139, 84) with width 72 and height 46.
; PLAN: r0=139(x), r1=84(y), r2=72(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 84
LDI r2, 72
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
