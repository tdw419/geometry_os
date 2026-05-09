; DESCRIPTION: Draws a yellow rectangle at (287, 39) with width 88 and height 111.
; PLAN: r0=287(x), r1=39(y), r2=88(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 39
LDI r2, 88
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
