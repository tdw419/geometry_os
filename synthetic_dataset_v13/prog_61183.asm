; DESCRIPTION: Draws a black rectangle at (157, 122) with width 90 and height 86.
; PLAN: r0=157(x), r1=122(y), r2=90(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 122
LDI r2, 90
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
