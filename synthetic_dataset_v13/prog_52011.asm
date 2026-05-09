; DESCRIPTION: Draws a green rectangle at (33, 139) with width 49 and height 27.
; PLAN: r0=33(x), r1=139(y), r2=49(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 139
LDI r2, 49
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
