; DESCRIPTION: Draws a blue rectangle at (49, 207) with width 75 and height 31.
; PLAN: r0=49(x), r1=207(y), r2=75(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 207
LDI r2, 75
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
