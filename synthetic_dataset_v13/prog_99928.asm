; DESCRIPTION: Draws a black rectangle at (121, 99) with width 18 and height 20.
; PLAN: r0=121(x), r1=99(y), r2=18(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 99
LDI r2, 18
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
