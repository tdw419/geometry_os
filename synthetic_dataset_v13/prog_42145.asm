; DESCRIPTION: Draws a black rectangle at (465, 69) with width 13 and height 15.
; PLAN: r0=465(x), r1=69(y), r2=13(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 69
LDI r2, 13
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
