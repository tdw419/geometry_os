; DESCRIPTION: Draws a white rectangle at (409, 4) with width 57 and height 19.
; PLAN: r0=409(x), r1=4(y), r2=57(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 4
LDI r2, 57
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
