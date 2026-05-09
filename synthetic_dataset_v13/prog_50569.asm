; DESCRIPTION: Draws a yellow rectangle at (127, 61) with width 43 and height 116.
; PLAN: r0=127(x), r1=61(y), r2=43(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 61
LDI r2, 43
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
