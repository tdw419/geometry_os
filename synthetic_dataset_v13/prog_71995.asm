; DESCRIPTION: Draws a black rectangle at (140, 10) with width 43 and height 61.
; PLAN: r0=140(x), r1=10(y), r2=43(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 10
LDI r2, 43
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
