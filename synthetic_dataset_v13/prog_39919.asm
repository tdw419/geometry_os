; DESCRIPTION: Draws a green rectangle at (13, 191) with width 96 and height 60.
; PLAN: r0=13(x), r1=191(y), r2=96(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 191
LDI r2, 96
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
