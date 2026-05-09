; DESCRIPTION: Draws a blue rectangle at (223, 52) with width 102 and height 104.
; PLAN: r0=223(x), r1=52(y), r2=102(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 52
LDI r2, 102
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
