; DESCRIPTION: Draws a black rectangle at (234, 123) with width 83 and height 99.
; PLAN: r0=234(x), r1=123(y), r2=83(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 123
LDI r2, 83
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
