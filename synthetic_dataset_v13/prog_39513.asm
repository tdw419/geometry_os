; DESCRIPTION: Draws a red rectangle at (254, 14) with width 118 and height 53.
; PLAN: r0=254(x), r1=14(y), r2=118(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 14
LDI r2, 118
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
