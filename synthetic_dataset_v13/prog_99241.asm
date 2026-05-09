; DESCRIPTION: Draws a black rectangle at (30, 87) with width 62 and height 110.
; PLAN: r0=30(x), r1=87(y), r2=62(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 87
LDI r2, 62
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
