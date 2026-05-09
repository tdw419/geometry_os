; DESCRIPTION: Draws a white rectangle at (93, 123) with width 31 and height 59.
; PLAN: r0=93(x), r1=123(y), r2=31(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 123
LDI r2, 31
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
