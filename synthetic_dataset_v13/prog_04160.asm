; DESCRIPTION: Draws a white rectangle at (326, 6) with width 18 and height 84.
; PLAN: r0=326(x), r1=6(y), r2=18(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 6
LDI r2, 18
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
