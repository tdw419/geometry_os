; DESCRIPTION: Draws a black rectangle at (432, 72) with width 13 and height 57.
; PLAN: r0=432(x), r1=72(y), r2=13(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 72
LDI r2, 13
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
