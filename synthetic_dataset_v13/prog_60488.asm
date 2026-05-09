; DESCRIPTION: Draws a black rectangle at (15, 143) with width 111 and height 74.
; PLAN: r0=15(x), r1=143(y), r2=111(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 143
LDI r2, 111
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
