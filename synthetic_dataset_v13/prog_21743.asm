; DESCRIPTION: Draws a yellow rectangle at (49, 111) with width 75 and height 88.
; PLAN: r0=49(x), r1=111(y), r2=75(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 111
LDI r2, 75
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
