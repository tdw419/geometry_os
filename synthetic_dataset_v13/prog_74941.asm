; DESCRIPTION: Draws a black rectangle at (307, 123) with width 106 and height 61.
; PLAN: r0=307(x), r1=123(y), r2=106(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 123
LDI r2, 106
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
