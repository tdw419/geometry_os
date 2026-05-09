; DESCRIPTION: Draws a red rectangle at (266, 35) with width 23 and height 29.
; PLAN: r0=266(x), r1=35(y), r2=23(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 35
LDI r2, 23
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
