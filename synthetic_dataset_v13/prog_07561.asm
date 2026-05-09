; DESCRIPTION: Draws a black rectangle at (111, 100) with width 81 and height 27.
; PLAN: r0=111(x), r1=100(y), r2=81(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 100
LDI r2, 81
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
