; DESCRIPTION: Draws a black rectangle at (20, 111) with width 78 and height 118.
; PLAN: r0=20(x), r1=111(y), r2=78(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 111
LDI r2, 78
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
