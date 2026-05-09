; DESCRIPTION: Draws a yellow rectangle at (369, 111) with width 78 and height 67.
; PLAN: r0=369(x), r1=111(y), r2=78(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 111
LDI r2, 78
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
