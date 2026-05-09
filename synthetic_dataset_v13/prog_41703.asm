; DESCRIPTION: Draws a green rectangle at (324, 139) with width 38 and height 96.
; PLAN: r0=324(x), r1=139(y), r2=38(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 139
LDI r2, 38
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
