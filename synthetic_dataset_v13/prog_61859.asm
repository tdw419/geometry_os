; DESCRIPTION: Draws a yellow rectangle at (371, 34) with width 29 and height 118.
; PLAN: r0=371(x), r1=34(y), r2=29(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 34
LDI r2, 29
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
