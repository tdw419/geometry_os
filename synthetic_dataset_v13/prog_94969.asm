; DESCRIPTION: Draws a black rectangle at (238, 179) with width 83 and height 12.
; PLAN: r0=238(x), r1=179(y), r2=83(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 179
LDI r2, 83
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
