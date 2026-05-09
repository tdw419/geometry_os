; DESCRIPTION: Draws a yellow rectangle at (225, 113) with width 61 and height 78.
; PLAN: r0=225(x), r1=113(y), r2=61(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 113
LDI r2, 61
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
