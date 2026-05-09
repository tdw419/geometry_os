; DESCRIPTION: Draws a yellow rectangle at (221, 113) with width 18 and height 113.
; PLAN: r0=221(x), r1=113(y), r2=18(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 113
LDI r2, 18
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
