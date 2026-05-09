; DESCRIPTION: Draws a white rectangle at (396, 98) with width 71 and height 31.
; PLAN: r0=396(x), r1=98(y), r2=71(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 98
LDI r2, 71
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
