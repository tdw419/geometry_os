; DESCRIPTION: Draws a green rectangle at (282, 14) with width 11 and height 100.
; PLAN: r0=282(x), r1=14(y), r2=11(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 14
LDI r2, 11
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
