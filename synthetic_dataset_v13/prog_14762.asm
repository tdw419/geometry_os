; DESCRIPTION: Draws a black rectangle at (396, 4) with width 106 and height 39.
; PLAN: r0=396(x), r1=4(y), r2=106(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 4
LDI r2, 106
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
