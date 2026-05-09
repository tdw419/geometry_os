; DESCRIPTION: Draws a black rectangle at (68, 53) with width 49 and height 39.
; PLAN: r0=68(x), r1=53(y), r2=49(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 53
LDI r2, 49
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
