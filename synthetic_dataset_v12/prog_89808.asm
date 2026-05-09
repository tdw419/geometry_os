; DESCRIPTION: Draws a green rectangle at (141, 128) with width 35 and height 15.
; PLAN: r0=141(x), r1=128(y), r2=35(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 128
LDI r2, 35
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
