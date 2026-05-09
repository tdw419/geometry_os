; DESCRIPTION: Draws a white rectangle at (396, 99) with width 62 and height 99.
; PLAN: r0=396(x), r1=99(y), r2=62(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 99
LDI r2, 62
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
