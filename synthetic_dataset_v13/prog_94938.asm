; DESCRIPTION: Draws a black rectangle at (377, 127) with width 52 and height 34.
; PLAN: r0=377(x), r1=127(y), r2=52(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 127
LDI r2, 52
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
