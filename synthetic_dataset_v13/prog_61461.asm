; DESCRIPTION: Draws a white rectangle at (23, 3) with width 31 and height 94.
; PLAN: r0=23(x), r1=3(y), r2=31(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 3
LDI r2, 31
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
