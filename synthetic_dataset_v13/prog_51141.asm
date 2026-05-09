; DESCRIPTION: Draws a yellow rectangle at (174, 93) with width 118 and height 101.
; PLAN: r0=174(x), r1=93(y), r2=118(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 93
LDI r2, 118
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
