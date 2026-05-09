; DESCRIPTION: Draws a black rectangle at (367, 93) with width 118 and height 29.
; PLAN: r0=367(x), r1=93(y), r2=118(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 93
LDI r2, 118
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
