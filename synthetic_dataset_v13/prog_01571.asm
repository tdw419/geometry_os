; DESCRIPTION: Draws a black rectangle at (31, 95) with width 27 and height 73.
; PLAN: r0=31(x), r1=95(y), r2=27(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 95
LDI r2, 27
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
