; DESCRIPTION: Draws a white rectangle at (457, 150) with width 31 and height 37.
; PLAN: r0=457(x), r1=150(y), r2=31(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 150
LDI r2, 31
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
