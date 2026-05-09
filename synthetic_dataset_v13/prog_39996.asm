; DESCRIPTION: Draws a black rectangle at (103, 108) with width 112 and height 26.
; PLAN: r0=103(x), r1=108(y), r2=112(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 108
LDI r2, 112
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
