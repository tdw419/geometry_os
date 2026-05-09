; DESCRIPTION: Draws a black rectangle at (282, 139) with width 68 and height 117.
; PLAN: r0=282(x), r1=139(y), r2=68(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 139
LDI r2, 68
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
