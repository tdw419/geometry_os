; DESCRIPTION: Draws a yellow rectangle at (147, 15) with width 67 and height 67.
; PLAN: r0=147(x), r1=15(y), r2=67(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 15
LDI r2, 67
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
