; DESCRIPTION: Draws a black rectangle at (430, 219) with width 59 and height 30.
; PLAN: r0=430(x), r1=219(y), r2=59(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 219
LDI r2, 59
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
