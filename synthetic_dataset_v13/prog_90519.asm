; DESCRIPTION: Draws a yellow rectangle at (332, 116) with width 24 and height 29.
; PLAN: r0=332(x), r1=116(y), r2=24(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 116
LDI r2, 24
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
