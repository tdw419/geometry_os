; DESCRIPTION: Draws a white rectangle at (331, 88) with width 90 and height 25.
; PLAN: r0=331(x), r1=88(y), r2=90(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 88
LDI r2, 90
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
