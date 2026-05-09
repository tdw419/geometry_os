; DESCRIPTION: Draws a yellow rectangle at (122, 181) with width 67 and height 31.
; PLAN: r0=122(x), r1=181(y), r2=67(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 181
LDI r2, 67
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
