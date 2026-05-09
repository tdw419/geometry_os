; DESCRIPTION: Draws a black rectangle at (215, 122) with width 12 and height 67.
; PLAN: r0=215(x), r1=122(y), r2=12(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 122
LDI r2, 12
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
