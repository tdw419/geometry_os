; DESCRIPTION: Draws a black rectangle at (52, 72) with width 99 and height 94.
; PLAN: r0=52(x), r1=72(y), r2=99(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 72
LDI r2, 99
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
