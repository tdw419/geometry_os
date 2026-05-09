; DESCRIPTION: Draws a orange rectangle at (371, 28) with width 96 and height 88.
; PLAN: r0=371(x), r1=28(y), r2=96(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 28
LDI r2, 96
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
