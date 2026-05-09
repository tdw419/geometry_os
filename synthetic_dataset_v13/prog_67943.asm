; DESCRIPTION: Draws a black rectangle at (147, 172) with width 32 and height 21.
; PLAN: r0=147(x), r1=172(y), r2=32(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 172
LDI r2, 32
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
