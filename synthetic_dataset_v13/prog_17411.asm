; DESCRIPTION: Draws a white rectangle at (138, 23) with width 97 and height 82.
; PLAN: r0=138(x), r1=23(y), r2=97(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 23
LDI r2, 97
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
