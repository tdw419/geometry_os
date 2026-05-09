; DESCRIPTION: Draws a yellow rectangle at (26, 121) with width 28 and height 96.
; PLAN: r0=26(x), r1=121(y), r2=28(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 121
LDI r2, 28
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
