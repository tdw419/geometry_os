; DESCRIPTION: Draws a black rectangle at (449, 96) with width 63 and height 112.
; PLAN: r0=449(x), r1=96(y), r2=63(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 96
LDI r2, 63
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
