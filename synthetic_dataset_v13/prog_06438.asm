; DESCRIPTION: Draws a green rectangle at (139, 73) with width 20 and height 16.
; PLAN: r0=139(x), r1=73(y), r2=20(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 73
LDI r2, 20
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
