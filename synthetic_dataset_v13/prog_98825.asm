; DESCRIPTION: Draws a black rectangle at (5, 143) with width 92 and height 83.
; PLAN: r0=5(x), r1=143(y), r2=92(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 143
LDI r2, 92
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
