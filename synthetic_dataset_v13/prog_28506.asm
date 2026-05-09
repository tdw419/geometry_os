; DESCRIPTION: Draws a white rectangle at (441, 119) with width 19 and height 99.
; PLAN: r0=441(x), r1=119(y), r2=19(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 119
LDI r2, 19
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
