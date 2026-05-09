; DESCRIPTION: Draws a black rectangle at (10, 9) with width 49 and height 91.
; PLAN: r0=10(x), r1=9(y), r2=49(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 9
LDI r2, 49
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
