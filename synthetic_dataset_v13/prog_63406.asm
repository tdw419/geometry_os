; DESCRIPTION: Draws a black rectangle at (258, 102) with width 87 and height 10.
; PLAN: r0=258(x), r1=102(y), r2=87(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 102
LDI r2, 87
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
