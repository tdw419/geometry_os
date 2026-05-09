; DESCRIPTION: Draws a yellow rectangle at (148, 183) with width 24 and height 11.
; PLAN: r0=148(x), r1=183(y), r2=24(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 183
LDI r2, 24
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
