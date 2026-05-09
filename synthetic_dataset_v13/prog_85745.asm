; DESCRIPTION: Draws a yellow rectangle at (287, 142) with width 86 and height 92.
; PLAN: r0=287(x), r1=142(y), r2=86(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 142
LDI r2, 86
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
