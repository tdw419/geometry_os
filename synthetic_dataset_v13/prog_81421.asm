; DESCRIPTION: Draws a yellow rectangle at (230, 39) with width 54 and height 118.
; PLAN: r0=230(x), r1=39(y), r2=54(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 39
LDI r2, 54
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
