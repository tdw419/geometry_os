; DESCRIPTION: Draws a white rectangle at (326, 52) with width 91 and height 87.
; PLAN: r0=326(x), r1=52(y), r2=91(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 52
LDI r2, 91
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
