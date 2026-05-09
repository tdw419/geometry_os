; DESCRIPTION: Draws a yellow rectangle at (312, 103) with width 67 and height 107.
; PLAN: r0=312(x), r1=103(y), r2=67(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 103
LDI r2, 67
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
