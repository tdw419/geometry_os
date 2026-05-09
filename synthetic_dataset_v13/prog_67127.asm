; DESCRIPTION: Draws a black rectangle at (134, 43) with width 27 and height 12.
; PLAN: r0=134(x), r1=43(y), r2=27(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 43
LDI r2, 27
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
