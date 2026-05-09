; DESCRIPTION: Draws a yellow rectangle at (123, 35) with width 72 and height 74.
; PLAN: r0=123(x), r1=35(y), r2=72(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 35
LDI r2, 72
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
