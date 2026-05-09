; DESCRIPTION: Draws a yellow rectangle at (170, 135) with width 88 and height 32.
; PLAN: r0=170(x), r1=135(y), r2=88(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 135
LDI r2, 88
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
