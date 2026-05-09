; DESCRIPTION: Draws a black rectangle at (355, 82) with width 89 and height 101.
; PLAN: r0=355(x), r1=82(y), r2=89(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 82
LDI r2, 89
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
