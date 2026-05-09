; DESCRIPTION: Draws a green rectangle at (137, 29) with width 12 and height 59.
; PLAN: r0=137(x), r1=29(y), r2=12(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 29
LDI r2, 12
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
