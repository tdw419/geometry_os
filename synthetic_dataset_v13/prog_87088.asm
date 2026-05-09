; DESCRIPTION: Draws a green rectangle at (271, 139) with width 75 and height 49.
; PLAN: r0=271(x), r1=139(y), r2=75(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 139
LDI r2, 75
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
