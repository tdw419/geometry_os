; DESCRIPTION: Draws a white rectangle at (313, 87) with width 119 and height 87.
; PLAN: r0=313(x), r1=87(y), r2=119(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 87
LDI r2, 119
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
