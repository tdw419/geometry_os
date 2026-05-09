; DESCRIPTION: Draws a yellow rectangle at (21, 21) with width 23 and height 118.
; PLAN: r0=21(x), r1=21(y), r2=23(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 21
LDI r2, 23
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
