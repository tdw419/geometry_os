; DESCRIPTION: Draws a black rectangle at (265, 183) with width 102 and height 45.
; PLAN: r0=265(x), r1=183(y), r2=102(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 183
LDI r2, 102
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
