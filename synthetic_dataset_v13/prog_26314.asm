; DESCRIPTION: Draws a yellow rectangle at (164, 118) with width 13 and height 99.
; PLAN: r0=164(x), r1=118(y), r2=13(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 118
LDI r2, 13
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
