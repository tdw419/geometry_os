; DESCRIPTION: Draws a black rectangle at (223, 4) with width 99 and height 15.
; PLAN: r0=223(x), r1=4(y), r2=99(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 4
LDI r2, 99
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
