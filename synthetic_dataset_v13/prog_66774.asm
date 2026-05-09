; DESCRIPTION: Draws a black rectangle at (355, 81) with width 95 and height 12.
; PLAN: r0=355(x), r1=81(y), r2=95(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 81
LDI r2, 95
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
