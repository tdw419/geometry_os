; DESCRIPTION: Draws a black rectangle at (73, 123) with width 27 and height 97.
; PLAN: r0=73(x), r1=123(y), r2=27(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 123
LDI r2, 27
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
