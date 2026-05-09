; DESCRIPTION: Draws a red rectangle at (232, 102) with width 85 and height 68.
; PLAN: r0=232(x), r1=102(y), r2=85(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 102
LDI r2, 85
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
