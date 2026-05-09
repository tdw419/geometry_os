; DESCRIPTION: Draws a black rectangle at (367, 122) with width 83 and height 78.
; PLAN: r0=367(x), r1=122(y), r2=83(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 122
LDI r2, 83
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
