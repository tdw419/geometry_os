; DESCRIPTION: Draws a yellow rectangle at (207, 29) with width 71 and height 11.
; PLAN: r0=207(x), r1=29(y), r2=71(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 29
LDI r2, 71
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
