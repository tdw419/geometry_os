; DESCRIPTION: Draws a green rectangle at (287, 139) with width 103 and height 73.
; PLAN: r0=287(x), r1=139(y), r2=103(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 139
LDI r2, 103
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
