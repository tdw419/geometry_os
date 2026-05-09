; DESCRIPTION: Draws a white rectangle at (367, 110) with width 72 and height 39.
; PLAN: r0=367(x), r1=110(y), r2=72(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 110
LDI r2, 72
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
