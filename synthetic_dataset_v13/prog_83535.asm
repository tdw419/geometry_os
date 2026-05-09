; DESCRIPTION: Draws a black rectangle at (93, 134) with width 80 and height 19.
; PLAN: r0=93(x), r1=134(y), r2=80(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 134
LDI r2, 80
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
