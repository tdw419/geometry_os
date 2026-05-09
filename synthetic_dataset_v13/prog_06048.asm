; DESCRIPTION: Draws a black rectangle at (388, 60) with width 13 and height 53.
; PLAN: r0=388(x), r1=60(y), r2=13(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 60
LDI r2, 13
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
