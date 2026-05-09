; DESCRIPTION: Draws a white rectangle at (185, 52) with width 56 and height 73.
; PLAN: r0=185(x), r1=52(y), r2=56(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 52
LDI r2, 56
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
