; DESCRIPTION: Draws a white rectangle at (396, 121) with width 97 and height 112.
; PLAN: r0=396(x), r1=121(y), r2=97(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 121
LDI r2, 97
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
