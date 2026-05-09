; DESCRIPTION: Draws a black rectangle at (295, 119) with width 102 and height 104.
; PLAN: r0=295(x), r1=119(y), r2=102(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 119
LDI r2, 102
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
