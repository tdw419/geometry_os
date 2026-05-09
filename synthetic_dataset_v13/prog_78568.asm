; DESCRIPTION: Draws a yellow rectangle at (25, 99) with width 14 and height 10.
; PLAN: r0=25(x), r1=99(y), r2=14(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 99
LDI r2, 14
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
