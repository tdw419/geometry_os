; DESCRIPTION: Draws a orange rectangle at (314, 151) with width 43 and height 78.
; PLAN: r0=314(x), r1=151(y), r2=43(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 151
LDI r2, 43
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
