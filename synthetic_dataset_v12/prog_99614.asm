; DESCRIPTION: Draws a black rectangle at (124, 155) with width 24 and height 16.
; PLAN: r0=124(x), r1=155(y), r2=24(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 155
LDI r2, 24
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
