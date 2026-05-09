; DESCRIPTION: Draws a yellow rectangle at (53, 68) with width 111 and height 114.
; PLAN: r0=53(x), r1=68(y), r2=111(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 68
LDI r2, 111
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
