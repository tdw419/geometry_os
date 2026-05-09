; DESCRIPTION: Draws a red rectangle at (26, 157) with width 101 and height 33.
; PLAN: r0=26(x), r1=157(y), r2=101(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 157
LDI r2, 101
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
