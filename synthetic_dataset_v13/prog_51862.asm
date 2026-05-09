; DESCRIPTION: Draws a red rectangle at (232, 206) with width 115 and height 15.
; PLAN: r0=232(x), r1=206(y), r2=115(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 206
LDI r2, 115
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
