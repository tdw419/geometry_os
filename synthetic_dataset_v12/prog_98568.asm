; DESCRIPTION: Draws a black rectangle at (100, 26) with width 76 and height 44.
; PLAN: r0=100(x), r1=26(y), r2=76(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 26
LDI r2, 76
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
