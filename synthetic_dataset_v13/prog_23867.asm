; DESCRIPTION: Draws a black rectangle at (1, 80) with width 102 and height 67.
; PLAN: r0=1(x), r1=80(y), r2=102(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 80
LDI r2, 102
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
