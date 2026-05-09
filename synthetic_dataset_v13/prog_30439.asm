; DESCRIPTION: Draws a yellow rectangle at (49, 171) with width 67 and height 10.
; PLAN: r0=49(x), r1=171(y), r2=67(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 171
LDI r2, 67
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
