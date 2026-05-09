; DESCRIPTION: Draws a black rectangle at (167, 81) with width 71 and height 14.
; PLAN: r0=167(x), r1=81(y), r2=71(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 81
LDI r2, 71
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
