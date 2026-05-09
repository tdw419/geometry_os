; DESCRIPTION: Draws a black rectangle at (59, 101) with width 61 and height 96.
; PLAN: r0=59(x), r1=101(y), r2=61(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 101
LDI r2, 61
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
