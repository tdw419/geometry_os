; DESCRIPTION: Draws a yellow rectangle at (48, 139) with width 14 and height 110.
; PLAN: r0=48(x), r1=139(y), r2=14(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 139
LDI r2, 14
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
