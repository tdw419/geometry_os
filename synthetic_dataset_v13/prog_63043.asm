; DESCRIPTION: Draws a green rectangle at (15, 38) with width 111 and height 92.
; PLAN: r0=15(x), r1=38(y), r2=111(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 38
LDI r2, 111
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
