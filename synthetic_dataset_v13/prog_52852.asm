; DESCRIPTION: Draws a white rectangle at (356, 77) with width 97 and height 73.
; PLAN: r0=356(x), r1=77(y), r2=97(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 77
LDI r2, 97
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
