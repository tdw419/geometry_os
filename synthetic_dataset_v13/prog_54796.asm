; DESCRIPTION: Draws a black rectangle at (421, 95) with width 28 and height 102.
; PLAN: r0=421(x), r1=95(y), r2=28(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 95
LDI r2, 28
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
