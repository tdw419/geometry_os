; DESCRIPTION: Draws a red rectangle at (188, 19) with width 35 and height 53.
; PLAN: r0=188(x), r1=19(y), r2=35(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 19
LDI r2, 35
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
