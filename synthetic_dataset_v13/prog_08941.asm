; DESCRIPTION: Draws a black rectangle at (411, 74) with width 43 and height 109.
; PLAN: r0=411(x), r1=74(y), r2=43(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 74
LDI r2, 43
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
