; DESCRIPTION: Draws a black rectangle at (249, 49) with width 32 and height 100.
; PLAN: r0=249(x), r1=49(y), r2=32(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 49
LDI r2, 32
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
