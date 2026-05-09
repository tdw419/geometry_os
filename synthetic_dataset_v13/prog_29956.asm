; DESCRIPTION: Draws a black rectangle at (449, 6) with width 46 and height 69.
; PLAN: r0=449(x), r1=6(y), r2=46(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 6
LDI r2, 46
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
