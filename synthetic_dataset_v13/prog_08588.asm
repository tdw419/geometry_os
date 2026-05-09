; DESCRIPTION: Draws a white rectangle at (11, 122) with width 68 and height 23.
; PLAN: r0=11(x), r1=122(y), r2=68(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 122
LDI r2, 68
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
