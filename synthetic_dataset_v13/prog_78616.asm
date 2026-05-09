; DESCRIPTION: Draws a black rectangle at (179, 19) with width 40 and height 83.
; PLAN: r0=179(x), r1=19(y), r2=40(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 19
LDI r2, 40
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
