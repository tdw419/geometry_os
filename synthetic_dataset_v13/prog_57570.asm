; DESCRIPTION: Draws a black rectangle at (72, 87) with width 16 and height 88.
; PLAN: r0=72(x), r1=87(y), r2=16(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 87
LDI r2, 16
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
