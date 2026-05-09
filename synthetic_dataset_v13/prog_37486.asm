; DESCRIPTION: Draws a yellow rectangle at (62, 135) with width 13 and height 104.
; PLAN: r0=62(x), r1=135(y), r2=13(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 135
LDI r2, 13
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
