; DESCRIPTION: Draws a black rectangle at (477, 8) with width 20 and height 39.
; PLAN: r0=477(x), r1=8(y), r2=20(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 8
LDI r2, 20
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
