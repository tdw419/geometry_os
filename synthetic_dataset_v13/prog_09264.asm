; DESCRIPTION: Draws a green rectangle at (15, 123) with width 32 and height 26.
; PLAN: r0=15(x), r1=123(y), r2=32(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 123
LDI r2, 32
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
