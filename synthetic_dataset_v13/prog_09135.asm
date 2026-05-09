; DESCRIPTION: Draws a black rectangle at (247, 113) with width 30 and height 78.
; PLAN: r0=247(x), r1=113(y), r2=30(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 113
LDI r2, 30
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
