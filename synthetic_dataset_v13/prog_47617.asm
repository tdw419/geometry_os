; DESCRIPTION: Draws a red rectangle at (318, 113) with width 73 and height 78.
; PLAN: r0=318(x), r1=113(y), r2=73(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 113
LDI r2, 73
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
