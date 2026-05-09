; DESCRIPTION: Draws a yellow rectangle at (280, 113) with width 51 and height 53.
; PLAN: r0=280(x), r1=113(y), r2=51(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 113
LDI r2, 51
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
