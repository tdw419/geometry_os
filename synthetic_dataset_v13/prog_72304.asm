; DESCRIPTION: Draws a yellow rectangle at (282, 20) with width 13 and height 116.
; PLAN: r0=282(x), r1=20(y), r2=13(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 20
LDI r2, 13
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
