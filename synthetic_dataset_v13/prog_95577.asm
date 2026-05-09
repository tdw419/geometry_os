; DESCRIPTION: Draws a black rectangle at (139, 81) with width 20 and height 82.
; PLAN: r0=139(x), r1=81(y), r2=20(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 81
LDI r2, 20
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
