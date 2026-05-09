; DESCRIPTION: Draws a black rectangle at (339, 3) with width 118 and height 57.
; PLAN: r0=339(x), r1=3(y), r2=118(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 3
LDI r2, 118
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
