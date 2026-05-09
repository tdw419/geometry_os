; DESCRIPTION: Draws a yellow rectangle at (183, 150) with width 19 and height 67.
; PLAN: r0=183(x), r1=150(y), r2=19(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 150
LDI r2, 19
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
