; DESCRIPTION: Draws a white rectangle at (254, 29) with width 57 and height 80.
; PLAN: r0=254(x), r1=29(y), r2=57(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 29
LDI r2, 57
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
