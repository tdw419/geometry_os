; DESCRIPTION: Draws a green rectangle at (462, 181) with width 38 and height 28.
; PLAN: r0=462(x), r1=181(y), r2=38(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 181
LDI r2, 38
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
