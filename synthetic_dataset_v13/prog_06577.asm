; DESCRIPTION: Draws a yellow rectangle at (383, 141) with width 111 and height 67.
; PLAN: r0=383(x), r1=141(y), r2=111(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 141
LDI r2, 111
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
