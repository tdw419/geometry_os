; DESCRIPTION: Draws a yellow rectangle at (28, 3) with width 86 and height 118.
; PLAN: r0=28(x), r1=3(y), r2=86(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 3
LDI r2, 86
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
