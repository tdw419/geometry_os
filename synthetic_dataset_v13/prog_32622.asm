; DESCRIPTION: Draws a black rectangle at (24, 134) with width 81 and height 111.
; PLAN: r0=24(x), r1=134(y), r2=81(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 134
LDI r2, 81
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
