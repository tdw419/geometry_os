; DESCRIPTION: Draws a black rectangle at (253, 55) with width 55 and height 55.
; PLAN: r0=253(x), r1=55(y), r2=55(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 55
LDI r2, 55
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
