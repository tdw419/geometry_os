; DESCRIPTION: Draws a yellow rectangle at (43, 141) with width 21 and height 59.
; PLAN: r0=43(x), r1=141(y), r2=21(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 141
LDI r2, 21
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
