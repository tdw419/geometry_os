; DESCRIPTION: Draws a black rectangle at (432, 55) with width 32 and height 10.
; PLAN: r0=432(x), r1=55(y), r2=32(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 55
LDI r2, 32
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
