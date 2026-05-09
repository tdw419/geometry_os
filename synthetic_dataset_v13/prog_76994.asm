; DESCRIPTION: Draws a black rectangle at (455, 45) with width 39 and height 114.
; PLAN: r0=455(x), r1=45(y), r2=39(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 45
LDI r2, 39
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
