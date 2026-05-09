; DESCRIPTION: Draws a black rectangle at (90, 50) with width 43 and height 99.
; PLAN: r0=90(x), r1=50(y), r2=43(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 50
LDI r2, 43
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
