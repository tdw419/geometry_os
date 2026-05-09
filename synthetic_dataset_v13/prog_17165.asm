; DESCRIPTION: Draws a black rectangle at (65, 36) with width 101 and height 36.
; PLAN: r0=65(x), r1=36(y), r2=101(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 36
LDI r2, 101
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
