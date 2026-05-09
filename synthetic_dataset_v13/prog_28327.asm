; DESCRIPTION: Draws a black rectangle at (212, 90) with width 53 and height 52.
; PLAN: r0=212(x), r1=90(y), r2=53(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 90
LDI r2, 53
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
