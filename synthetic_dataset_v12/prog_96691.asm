; DESCRIPTION: Draws a green rectangle at (1, 53) with width 93 and height 118.
; PLAN: r0=1(x), r1=53(y), r2=93(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 53
LDI r2, 93
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
