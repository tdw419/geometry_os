; DESCRIPTION: Draws a black rectangle at (120, 43) with width 63 and height 76.
; PLAN: r0=120(x), r1=43(y), r2=63(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 43
LDI r2, 63
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
