; DESCRIPTION: Draws a black rectangle at (49, 82) with width 96 and height 39.
; PLAN: r0=49(x), r1=82(y), r2=96(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 82
LDI r2, 96
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
