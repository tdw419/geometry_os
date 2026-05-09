; DESCRIPTION: Draws a black rectangle at (339, 141) with width 63 and height 24.
; PLAN: r0=339(x), r1=141(y), r2=63(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 141
LDI r2, 63
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
