; DESCRIPTION: Draws a purple rectangle at (341, 148) with width 93 and height 52.
; PLAN: r0=341(x), r1=148(y), r2=93(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 148
LDI r2, 93
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
