; DESCRIPTION: Draws a black rectangle at (5, 193) with width 101 and height 57.
; PLAN: r0=5(x), r1=193(y), r2=101(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 193
LDI r2, 101
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
