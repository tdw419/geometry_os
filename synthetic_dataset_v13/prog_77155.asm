; DESCRIPTION: Draws a white rectangle at (142, 199) with width 90 and height 17.
; PLAN: r0=142(x), r1=199(y), r2=90(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 199
LDI r2, 90
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
