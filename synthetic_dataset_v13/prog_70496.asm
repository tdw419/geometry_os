; DESCRIPTION: Draws a green rectangle at (148, 178) with width 93 and height 45.
; PLAN: r0=148(x), r1=178(y), r2=93(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 178
LDI r2, 93
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
