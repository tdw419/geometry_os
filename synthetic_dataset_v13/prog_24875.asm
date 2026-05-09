; DESCRIPTION: Draws a black rectangle at (212, 101) with width 46 and height 85.
; PLAN: r0=212(x), r1=101(y), r2=46(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 101
LDI r2, 46
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
