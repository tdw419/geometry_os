; DESCRIPTION: Draws a red rectangle at (38, 43) with width 22 and height 78.
; PLAN: r0=38(x), r1=43(y), r2=22(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 43
LDI r2, 22
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
