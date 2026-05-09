; DESCRIPTION: Draws a yellow rectangle at (376, 88) with width 11 and height 18.
; PLAN: r0=376(x), r1=88(y), r2=11(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 88
LDI r2, 11
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
