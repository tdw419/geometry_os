; DESCRIPTION: Draws a white rectangle at (107, 97) with width 34 and height 35.
; PLAN: r0=107(x), r1=97(y), r2=34(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 97
LDI r2, 34
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
