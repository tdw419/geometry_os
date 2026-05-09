; DESCRIPTION: Draws a black rectangle at (144, 22) with width 45 and height 45.
; PLAN: r0=144(x), r1=22(y), r2=45(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 22
LDI r2, 45
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
