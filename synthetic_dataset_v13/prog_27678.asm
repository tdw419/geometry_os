; DESCRIPTION: Draws a yellow rectangle at (476, 85) with width 17 and height 32.
; PLAN: r0=476(x), r1=85(y), r2=17(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 85
LDI r2, 17
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
