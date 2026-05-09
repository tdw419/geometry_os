; DESCRIPTION: Draws a red rectangle at (204, 18) with width 110 and height 104.
; PLAN: r0=204(x), r1=18(y), r2=110(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 18
LDI r2, 110
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
