; DESCRIPTION: Draws a black rectangle at (35, 189) with width 87 and height 36.
; PLAN: r0=35(x), r1=189(y), r2=87(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 189
LDI r2, 87
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
