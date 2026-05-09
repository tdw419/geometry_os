; DESCRIPTION: Draws a black rectangle at (113, 49) with width 40 and height 20.
; PLAN: r0=113(x), r1=49(y), r2=40(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 49
LDI r2, 40
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
