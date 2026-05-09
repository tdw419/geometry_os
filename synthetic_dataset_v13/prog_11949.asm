; DESCRIPTION: Draws a green rectangle at (64, 167) with width 110 and height 55.
; PLAN: r0=64(x), r1=167(y), r2=110(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 167
LDI r2, 110
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
