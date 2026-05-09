; DESCRIPTION: Draws a white rectangle at (254, 77) with width 62 and height 65.
; PLAN: r0=254(x), r1=77(y), r2=62(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 77
LDI r2, 62
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
