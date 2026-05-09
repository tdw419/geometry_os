; DESCRIPTION: Draws a white rectangle at (367, 148) with width 88 and height 43.
; PLAN: r0=367(x), r1=148(y), r2=88(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 148
LDI r2, 88
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
