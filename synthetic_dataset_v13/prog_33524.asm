; DESCRIPTION: Draws a black rectangle at (233, 96) with width 83 and height 55.
; PLAN: r0=233(x), r1=96(y), r2=83(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 96
LDI r2, 83
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
