; DESCRIPTION: Draws a green rectangle at (282, 68) with width 18 and height 34.
; PLAN: r0=282(x), r1=68(y), r2=18(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 68
LDI r2, 18
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
