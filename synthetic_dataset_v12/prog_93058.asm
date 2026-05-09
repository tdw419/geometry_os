; DESCRIPTION: Draws a black rectangle at (46, 3) with width 72 and height 43.
; PLAN: r0=46(x), r1=3(y), r2=72(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 3
LDI r2, 72
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
