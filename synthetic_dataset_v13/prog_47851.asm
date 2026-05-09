; DESCRIPTION: Draws a blue rectangle at (137, 167) with width 33 and height 30.
; PLAN: r0=137(x), r1=167(y), r2=33(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 167
LDI r2, 33
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
