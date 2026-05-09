; DESCRIPTION: Draws a black rectangle at (236, 113) with width 59 and height 73.
; PLAN: r0=236(x), r1=113(y), r2=59(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 113
LDI r2, 59
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
