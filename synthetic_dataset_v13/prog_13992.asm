; DESCRIPTION: Draws a white rectangle at (250, 112) with width 29 and height 116.
; PLAN: r0=250(x), r1=112(y), r2=29(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 112
LDI r2, 29
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
