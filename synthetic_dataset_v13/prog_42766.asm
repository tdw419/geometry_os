; DESCRIPTION: Draws a black rectangle at (117, 6) with width 72 and height 89.
; PLAN: r0=117(x), r1=6(y), r2=72(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 6
LDI r2, 72
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
