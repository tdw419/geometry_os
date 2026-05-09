; DESCRIPTION: Draws a white rectangle at (165, 61) with width 48 and height 97.
; PLAN: r0=165(x), r1=61(y), r2=48(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 61
LDI r2, 48
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
