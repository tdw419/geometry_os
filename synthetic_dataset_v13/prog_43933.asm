; DESCRIPTION: Draws a yellow rectangle at (111, 119) with width 17 and height 67.
; PLAN: r0=111(x), r1=119(y), r2=17(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 119
LDI r2, 17
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
