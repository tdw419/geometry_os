; DESCRIPTION: Draws a blue rectangle at (296, 110) with width 31 and height 72.
; PLAN: r0=296(x), r1=110(y), r2=31(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 110
LDI r2, 31
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
