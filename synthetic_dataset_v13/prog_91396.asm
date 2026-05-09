; DESCRIPTION: Draws a yellow rectangle at (209, 112) with width 14 and height 88.
; PLAN: r0=209(x), r1=112(y), r2=14(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 112
LDI r2, 14
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
