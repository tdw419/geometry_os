; DESCRIPTION: Draws a black rectangle at (124, 49) with width 95 and height 49.
; PLAN: r0=124(x), r1=49(y), r2=95(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 49
LDI r2, 95
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
