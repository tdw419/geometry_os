; DESCRIPTION: Draws a black rectangle at (12, 136) with width 64 and height 116.
; PLAN: r0=12(x), r1=136(y), r2=64(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 136
LDI r2, 64
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
