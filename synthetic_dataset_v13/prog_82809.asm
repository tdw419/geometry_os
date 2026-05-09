; DESCRIPTION: Draws a white rectangle at (444, 78) with width 19 and height 52.
; PLAN: r0=444(x), r1=78(y), r2=19(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 78
LDI r2, 19
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
