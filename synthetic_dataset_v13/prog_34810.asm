; DESCRIPTION: Draws a yellow rectangle at (38, 130) with width 53 and height 22.
; PLAN: r0=38(x), r1=130(y), r2=53(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 130
LDI r2, 53
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
