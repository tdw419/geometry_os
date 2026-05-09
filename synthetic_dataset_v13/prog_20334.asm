; DESCRIPTION: Draws a yellow rectangle at (23, 73) with width 31 and height 118.
; PLAN: r0=23(x), r1=73(y), r2=31(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 73
LDI r2, 31
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
