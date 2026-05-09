; DESCRIPTION: Draws a black rectangle at (49, 54) with width 33 and height 83.
; PLAN: r0=49(x), r1=54(y), r2=33(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 54
LDI r2, 33
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
