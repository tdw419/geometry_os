; DESCRIPTION: Draws a black rectangle at (163, 53) with width 95 and height 71.
; PLAN: r0=163(x), r1=53(y), r2=95(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 53
LDI r2, 95
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
