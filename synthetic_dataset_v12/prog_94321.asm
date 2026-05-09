; DESCRIPTION: Draws a yellow rectangle at (222, 157) with width 104 and height 15.
; PLAN: r0=222(x), r1=157(y), r2=104(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 157
LDI r2, 104
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
