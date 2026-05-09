; DESCRIPTION: Draws a white rectangle at (24, 69) with width 97 and height 86.
; PLAN: r0=24(x), r1=69(y), r2=97(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 69
LDI r2, 97
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
