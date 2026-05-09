; DESCRIPTION: Draws a yellow rectangle at (75, 139) with width 94 and height 102.
; PLAN: r0=75(x), r1=139(y), r2=94(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 139
LDI r2, 94
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
