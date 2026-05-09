; DESCRIPTION: Draws a yellow rectangle at (46, 113) with width 112 and height 18.
; PLAN: r0=46(x), r1=113(y), r2=112(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 113
LDI r2, 112
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
