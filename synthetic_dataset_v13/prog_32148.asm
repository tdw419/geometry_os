; DESCRIPTION: Draws a yellow rectangle at (4, 29) with width 14 and height 91.
; PLAN: r0=4(x), r1=29(y), r2=14(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 29
LDI r2, 14
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
