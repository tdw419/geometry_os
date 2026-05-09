; DESCRIPTION: Draws a white rectangle at (396, 39) with width 89 and height 11.
; PLAN: r0=396(x), r1=39(y), r2=89(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 39
LDI r2, 89
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
