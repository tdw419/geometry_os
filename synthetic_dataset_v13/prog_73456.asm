; DESCRIPTION: Draws a white rectangle at (16, 61) with width 52 and height 112.
; PLAN: r0=16(x), r1=61(y), r2=52(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 61
LDI r2, 52
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
