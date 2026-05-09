; DESCRIPTION: Draws a white rectangle at (37, 78) with width 68 and height 78.
; PLAN: r0=37(x), r1=78(y), r2=68(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 78
LDI r2, 68
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
