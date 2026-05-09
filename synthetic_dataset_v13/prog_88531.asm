; DESCRIPTION: Draws a green rectangle at (191, 29) with width 82 and height 104.
; PLAN: r0=191(x), r1=29(y), r2=82(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 29
LDI r2, 82
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
