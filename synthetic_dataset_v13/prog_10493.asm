; DESCRIPTION: Draws a yellow rectangle at (31, 30) with width 104 and height 38.
; PLAN: r0=31(x), r1=30(y), r2=104(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 30
LDI r2, 104
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
