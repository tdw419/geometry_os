; DESCRIPTION: Draws a white rectangle at (23, 68) with width 78 and height 99.
; PLAN: r0=23(x), r1=68(y), r2=78(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 68
LDI r2, 78
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
