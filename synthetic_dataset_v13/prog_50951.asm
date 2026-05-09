; DESCRIPTION: Draws a black rectangle at (93, 111) with width 66 and height 37.
; PLAN: r0=93(x), r1=111(y), r2=66(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 111
LDI r2, 66
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
