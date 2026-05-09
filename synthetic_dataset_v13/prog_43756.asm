; DESCRIPTION: Draws a black rectangle at (407, 142) with width 36 and height 39.
; PLAN: r0=407(x), r1=142(y), r2=36(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 142
LDI r2, 36
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
