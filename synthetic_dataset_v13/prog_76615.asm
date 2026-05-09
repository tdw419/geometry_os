; DESCRIPTION: Draws a black rectangle at (169, 86) with width 52 and height 57.
; PLAN: r0=169(x), r1=86(y), r2=52(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 86
LDI r2, 52
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
