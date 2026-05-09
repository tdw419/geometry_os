; DESCRIPTION: Draws a red rectangle at (287, 104) with width 108 and height 114.
; PLAN: r0=287(x), r1=104(y), r2=108(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 104
LDI r2, 108
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
