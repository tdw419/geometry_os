; DESCRIPTION: Draws a black rectangle at (12, 96) with width 78 and height 104.
; PLAN: r0=12(x), r1=96(y), r2=78(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 96
LDI r2, 78
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
