; DESCRIPTION: Draws a black rectangle at (139, 143) with width 11 and height 60.
; PLAN: r0=139(x), r1=143(y), r2=11(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 143
LDI r2, 11
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
