; DESCRIPTION: Draws a yellow rectangle at (15, 104) with width 76 and height 113.
; PLAN: r0=15(x), r1=104(y), r2=76(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 104
LDI r2, 76
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
