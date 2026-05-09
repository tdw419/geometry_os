; DESCRIPTION: Draws a red rectangle at (155, 102) with width 93 and height 11.
; PLAN: r0=155(x), r1=102(y), r2=93(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 102
LDI r2, 93
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
