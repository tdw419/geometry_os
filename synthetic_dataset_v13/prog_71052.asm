; DESCRIPTION: Draws a green rectangle at (312, 31) with width 67 and height 29.
; PLAN: r0=312(x), r1=31(y), r2=67(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 31
LDI r2, 67
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
