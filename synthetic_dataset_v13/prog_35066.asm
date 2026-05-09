; DESCRIPTION: Draws a yellow rectangle at (141, 100) with width 67 and height 46.
; PLAN: r0=141(x), r1=100(y), r2=67(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 100
LDI r2, 67
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
