; DESCRIPTION: Draws a black rectangle at (153, 14) with width 113 and height 23.
; PLAN: r0=153(x), r1=14(y), r2=113(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 14
LDI r2, 113
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
