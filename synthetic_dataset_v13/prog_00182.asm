; DESCRIPTION: Draws a black rectangle at (11, 103) with width 87 and height 38.
; PLAN: r0=11(x), r1=103(y), r2=87(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 103
LDI r2, 87
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
