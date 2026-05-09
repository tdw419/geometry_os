; DESCRIPTION: Draws a black rectangle at (162, 104) with width 13 and height 16.
; PLAN: r0=162(x), r1=104(y), r2=13(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 104
LDI r2, 13
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
