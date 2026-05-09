; DESCRIPTION: Draws a orange rectangle at (341, 227) with width 67 and height 26.
; PLAN: r0=341(x), r1=227(y), r2=67(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 227
LDI r2, 67
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
