; DESCRIPTION: Draws a red rectangle at (311, 94) with width 76 and height 115.
; PLAN: r0=311(x), r1=94(y), r2=76(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 94
LDI r2, 76
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
